part of 'authentication_bloc.dart';

@immutable
sealed class AuthenticationState {}

final class AuthenticationInitial extends AuthenticationState {}

final class AuthenticationLoading extends AuthenticationState {}

final class UserRegisteredSuccess extends AuthenticationState {
  final RideXUser user;
  UserRegisteredSuccess({required this.user});
}

final class UserLoginSuccess extends AuthenticationState {
  final RideXUser user;
  UserLoginSuccess({required this.user});
}

final class LogoutSuccess extends AuthenticationState {
  final String message;
  LogoutSuccess({required this.message});
}

final class LogoutFailed extends AuthenticationState {
  final String message;
  LogoutFailed({required this.message});
}

final class AuthenticationFailure extends AuthenticationState {
  final String errorMessage;
  AuthenticationFailure({required this.errorMessage});
}