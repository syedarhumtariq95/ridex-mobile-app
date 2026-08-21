import '../../models/authentication/authentication_model.dart';
import 'authentication_provider.dart';

class AuthenticationRepository {
  final provider = AuthenticationProvider();

  Future<bool> register({
    required String email,
    required String password,
    required String fullName,
    required String phone,
    required String role,
  }) => provider.register(
    email: email,
    password: password,
    fullName: fullName,
    phone: phone,
    role: role,
  );

  /// Login
  Future<bool> login({
    required String email,
    required String password,
    required bool remember,
    required String expectedRole,
  }) => provider.login(
    email: email,
    password: password,
    remember: remember,
    expectedRole: expectedRole,
  );

  Future<(bool success, String message)> logout() => provider.logout();

  Future<RideXUser?> loadSavedUser() => provider.loadSavedUser();

  Future<void> setOnboardingCompleted() => provider.setOnboardingCompleted();

  Future<bool> isOnboardingCompleted() => provider.isOnboardingCompleted();

  Future<void> clear() => provider.clear();
}