abstract class AuthEvent {}

class LoginEvent extends AuthEvent {
  final String email;
  final String password;
  LoginEvent(this.email, this.password);
}

class RegisterEvent extends AuthEvent {
  final String username;
  final String email;
  final String password;
  RegisterEvent(this.username, this.email, this.password);
}

class ForgotPasswordEvent extends AuthEvent {
  final String email;
  ForgotPasswordEvent(this.email);
}

class ResetPasswordEvent extends AuthEvent {
  final String email;
  final String otp;
  final String newPassword;
  ResetPasswordEvent(this.email, this.otp, this.newPassword);
}
