import './api_service.dart';

class AuthApi {
  final ApiService _apiService = ApiService();

  Future<Map<String, dynamic>> login(String email, String password) async {
    return await _apiService.post("/auth/login", {
      "email": email,
      "password": password,
    });
  }

  Future<Map<String, dynamic>> register(
    String username,
    String email,
    String password,
  ) async {
    return await _apiService.post("/auth/register", {
      "username": username,
      "email": email,
      "password": password,
    });
  }

  Future<Map<String, dynamic>> forgotPassword(
    String email,
  ) async {
    return await _apiService.post("/auth/forgot-password", {
      "email": email,
    });
  }

  Future<Map<String, dynamic>> resetPassword(
    String email,
    String otp,
    String newPassword,
  ) async {
    return await _apiService.post("/auth/reset-password", {
      "email": email,
      "otp": otp,
      "newPassword": "newPassword"
    });
  }
}
