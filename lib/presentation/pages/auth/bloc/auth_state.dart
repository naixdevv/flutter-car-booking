class AuthState {
  final bool isLoading;
  final bool isSuccess;
  final String? error;

  AuthState({this.isLoading = false, this.isSuccess = false, this.error});

  AuthState copyWith({bool? isLoading, bool? isSuccess, String? error}) {
    return AuthState(
      isLoading: isLoading ?? this.isLoading,
      isSuccess: isSuccess ?? this.isSuccess,
      error: error,
    );
  }
}
