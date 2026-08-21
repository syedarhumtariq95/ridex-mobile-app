part of 'authentication_bloc.dart';

@immutable
abstract class AuthenticationEvent {}

class RegisterUserRequested extends AuthenticationEvent {
  final String email;
  final String password;
  final String fullName;
  final String phone;
  final String role;

  RegisterUserRequested({
    required this.email,
    required this.password,
    required this.fullName,
    required this.phone,
    required this.role,
  });
}

class LoginUserWithEmailRequested extends AuthenticationEvent {
  final String email;
  final String password;
  final bool remember;
  final String expectedRole;

  LoginUserWithEmailRequested({
    required this.email,
    required this.password,
    required this.remember,
    required this.expectedRole,
  });
}

class CheckSavedUserSessionRequested extends AuthenticationEvent {}

class LogoutUserRequested extends AuthenticationEvent {}

class ResetAuthenticationState extends AuthenticationEvent {}