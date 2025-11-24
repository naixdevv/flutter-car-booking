import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_car_booking/data/datasources/remote/auth_api.dart';
import 'package:flutter_car_booking/core/services/secure_storage_service.dart';
import 'auth_event.dart';
import 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  final AuthApi api;
  final secureStorageService = SecureStorageService();

  AuthBloc(this.api) : super(AuthState()) {
    on<LoginEvent>(_login);
    on<RegisterEvent>(_register);
    on<ForgotPasswordEvent>(_forgotPassword);
    on<ResetPasswordEvent>(_resetPassword);
  }

  Future<void> _login(LoginEvent event, Emitter<AuthState> emit) async {
    emit(state.copyWith(isLoading: true, error: null));

    try {
      final response = await api.login(event.email, event.password);

      if (response["success"] == true) {
        await secureStorageService.saveToken(response["data"]["token"]);
        emit(state.copyWith(isLoading: false, isSuccess: true));
      } else {
        emit(
          state.copyWith(
            isLoading: false,
            error: response["message"] ?? "Login failed",
          ),
        );
      }
    } catch (e) {
      emit(state.copyWith(isLoading: false, error: e.toString()));
    }
  }

  Future<void> _register(RegisterEvent event, Emitter<AuthState> emit) async {
    emit(state.copyWith(isLoading: true, error: null));

    try {
      final response = await api.register(
        event.username,
        event.email,
        event.password,
      );

      if (response["success"] == true) {
        emit(state.copyWith(isLoading: false, isSuccess: true));
      } else {
        emit(
          state.copyWith(
            isLoading: false,
            error: response["message"] ?? "Register failed",
          ),
        );
      }
    } catch (e) {
      emit(state.copyWith(isLoading: false, error: e.toString()));
    }
  }

  Future<void> _forgotPassword(
    ForgotPasswordEvent event,
    Emitter<AuthState> emit,
  ) async {
    emit(state.copyWith(isLoading: true, error: null));

    try {
      final response = await api.forgotPassword(event.email);

      if (response["success"] == true) {
        emit(state.copyWith(isLoading: false, isSuccess: true));
      } else {
        emit(
          state.copyWith(
            isLoading: false,
            error: response["message"] ?? "Forgot Password failed",
          ),
        );
      }
    } catch (e) {
      emit(state.copyWith(isLoading: false, error: e.toString()));
    }
  }

  Future<void> _resetPassword(
    ResetPasswordEvent event,
    Emitter<AuthState> emit,
  ) async {
    emit(state.copyWith(isLoading: true, error: null));

    try {
      final response = await api.resetPassword(
        event.email,
        event.otp,
        event.newPassword,
      );

      if (response["success"] == true) {
        emit(state.copyWith(isLoading: false, isSuccess: true));
      } else {
        emit(
          state.copyWith(
            isLoading: false,
            error: response["message"] ?? "Reset Password failed",
          ),
        );
      }
    } catch (e) {
      emit(state.copyWith(isLoading: false, error: e.toString()));
    }
  }
}
