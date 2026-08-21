import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';
import '../../models/authentication/authentication_model.dart';
import '../../resources/authentication/authentication_repository.dart';

part 'authentication_event.dart';
part 'authentication_state.dart';

class AuthenticationBloc
    extends Bloc<AuthenticationEvent, AuthenticationState> {
  final repository = AuthenticationRepository();
  RideXUser? user;

  AuthenticationBloc() : super(AuthenticationInitial()) {

    // Register
    on<RegisterUserRequested>((event, emit) async {
      emit(AuthenticationLoading());
      final success = await repository.register(
        email: event.email,
        password: event.password,
        fullName: event.fullName,
        phone: event.phone,
        role: event.role,
      );

      if (success && user != null) {
        emit(UserRegisteredSuccess(user: user!));
      } else {
        emit(AuthenticationFailure(errorMessage: "Registration Failed"));
      }
    });

    // Login (Updated with expectedRole)
    on<LoginUserWithEmailRequested>((event, emit) async {
      emit(AuthenticationLoading());
      final success = await repository.login(
        email: event.email,
        password: event.password,
        remember: event.remember,
        expectedRole: event.expectedRole,
      );

      if (success && user != null) {
        emit(UserLoginSuccess(user: user!));
      } else {
        emit(AuthenticationFailure(errorMessage: "Authentication Failed"));
      }
    });

    // Auto Login Session Check
    on<CheckSavedUserSessionRequested>((event, emit) async {
      emit(AuthenticationLoading());
      final savedUser = await repository.loadSavedUser();
      if (savedUser != null) {
        user = savedUser;
        emit(UserLoginSuccess(user: savedUser));
      } else {
        emit(AuthenticationInitial());
      }
    });

    // Logout
    on<LogoutUserRequested>((event, emit) async {
      emit(AuthenticationLoading());
      final result = await repository.logout();
      if (result.$1) {
        user = null;
        emit(LogoutSuccess(message: result.$2));
      } else {
        emit(LogoutFailed(message: result.$2));
      }
    });

    // Reset State
    on<ResetAuthenticationState>((event, emit) {
      emit(AuthenticationInitial());
    });
  }
}