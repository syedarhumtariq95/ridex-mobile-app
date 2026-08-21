import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

import '../../../configs/dependency_injection/dependency_injection.dart';
import '../../../configs/dependency_injection/navigation_service.dart';
import '../../../configs/local_storage_sqflite/local_storage_sqflite.dart';
import '../../../configs/local_storage_sqflite/sqflite_model.dart';
import '../../blocs/authentication/authentication_bloc.dart';
import '../../models/authentication/authentication_model.dart';

class AuthenticationProvider {
  final SupabaseClient _supabase = Supabase.instance.client;
  final String _userKey = "ridex_user";
  final String _onboardingKey = "onboarding_completed";

  bool get isUserLogin => _supabase.auth.currentSession != null;
  String get accessToken => _supabase.auth.currentSession?.accessToken ?? "";
  String get refreshToken => _supabase.auth.currentSession?.refreshToken ?? "";

  // Helper method to display SnackBar via NavigationService
  void _displaySnackBar(String message, {bool isError = false}) {
    DI.i<NavigationService>().runContextSafeFunction(() {
      final context = DI.i<NavigationService>().getContext();
      if (context != null) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(message),
            backgroundColor: isError ? Colors.red : Colors.green,
          ),
        );
      }
    });
  }

  // Onboarding Helpers
  Future<void> setOnboardingCompleted() async {
    await LocalStorageSqfLite.insertData(
      Data(key: _onboardingKey, value: "true"),
    );
  }

  Future<bool> isOnboardingCompleted() async {
    final data = await LocalStorageSqfLite.getDataByKey(_onboardingKey);
    return data != null && data.value == "true";
  }

  /// Supabase Register (Customer / Driver)
  Future<bool> register({
    required String email,
    required String password,
    required String fullName,
    required String phone,
    required String role,
  }) async {
    try {
      final AuthResponse response = await _supabase.auth.signUp(
        email: email,
        password: password,
      );

      if (response.user != null) {
        // Upsert use kar rahe hain taake existing conflict na aaye
        await _supabase.from('profiles').upsert({
          'id': response.user!.id,
          'full_name': fullName,
          'phone': phone,
          'role': role,
        });

        final userModel = RideXUser(
          id: response.user!.id,
          email: email,
          fullName: fullName,
          phone: phone,
          role: role,
        );

        DI.i<AuthenticationBloc>().user = userModel;
        await saveUser(userModel);

        _displaySnackBar("Registration successful!", isError: false);
        return true;
      }
      return false;
    } catch (e) {
      _displaySnackBar(e.toString(), isError: true);
      return false;
    }
  }

  /// Supabase Login with Role Validation
  Future<bool> login({
    required String email,
    required String password,
    required bool remember,
    required String expectedRole, // 'customer' ya 'driver' pass karein
  }) async {
    try {
      final AuthResponse response = await _supabase.auth.signInWithPassword(
        email: email,
        password: password,
      );

      if (response.user != null) {
        // Profile fetch
        final profile = await _supabase
            .from('profiles')
            .select()
            .eq('id', response.user!.id)
            .maybeSingle();

        final String actualRole = profile?['role'] ?? 'customer';

        // Role Validation Check
        if (actualRole.toLowerCase() != expectedRole.toLowerCase()) {
          await _supabase.auth.signOut();
          _displaySnackBar(
            "Access Denied: This account is registered as a $actualRole.",
            isError: true,
          );
          return false;
        }

        // Profile missing ki soorat mein auto-creation
        if (profile == null) {
          await _supabase.from('profiles').upsert({
            'id': response.user!.id,
            'full_name': 'User',
            'phone': '',
            'role': expectedRole,
          });
        }

        final userModel = RideXUser(
          id: response.user!.id,
          email: email,
          fullName: profile?['full_name'] ?? 'User',
          phone: profile?['phone'] ?? '',
          role: actualRole,
        );

        DI.i<AuthenticationBloc>().user = userModel;

        if (remember) {
          await saveUser(userModel);
        }

        _displaySnackBar("Login successful!", isError: false);
        return true;
      }
      return false;
    } catch (e) {
      _displaySnackBar(e.toString(), isError: true);
      return false;
    }
  }

  /// Supabase Logout
  Future<(bool success, String message)> logout() async {
    try {
      await _supabase.auth.signOut();
      await clear();
      DI.i<AuthenticationBloc>().user = null;
      return (true, "Logged out successfully");
    } catch (e) {
      return (false, e.toString());
    }
  }

  /// Restore Saved Session
  Future<RideXUser?> loadSavedUser() async {
    final session = _supabase.auth.currentSession;
    if (session == null) {
      await clear();
      return null;
    }

    try {
      final profile = await _supabase
          .from('profiles')
          .select()
          .eq('id', session.user.id)
          .maybeSingle();

      final userModel = RideXUser(
        id: session.user.id,
        email: session.user.email ?? '',
        fullName: profile?['full_name'] ?? 'User',
        phone: profile?['phone'] ?? '',
        role: profile?['role'] ?? 'customer',
      );

      DI.i<AuthenticationBloc>().user = userModel;
      return userModel;
    } catch (e) {
      return null;
    }
  }

  /// Local Storage Operations
  Future<void> saveUser(RideXUser user) async {
    await LocalStorageSqfLite.insertData(
      Data(key: _userKey, value: jsonEncode(user.toJson())),
    );
  }

  Future<void> clear() async {
    await LocalStorageSqfLite.deleteData(_userKey);
  }
}