import 'package:flutter/material.dart';
import 'app_routes.dart';
import '../presentation/pages/home/home_page.dart';
import '../presentation/pages/booking/booking_page.dart';
import '../presentation/pages/booking/booking_search_result_page.dart';
import '../presentation/pages/booking/booking_confirm_page.dart';
import '../presentation/pages/booking/booking_success_page.dart';
import '../presentation/pages/trips/trip_page.dart';
import '../presentation/pages/profile/profile_page.dart';
import '../presentation/pages/profile/language_page.dart';
import '../presentation/pages/auth/login_page.dart';
import '../presentation/pages/auth/register_page.dart';
import '../presentation/pages/auth/forgot_password_page.dart';
import '../presentation/pages/auth/enter_verification_code_page.dart';
import '../presentation/pages/auth/reset_password_success_page.dart';
import '../presentation/pages/not_found/not_found_page.dart';

class AppRouter {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      // Bottom Bar
      case AppRoutes.home:
        return _page(const HomePage());
      case AppRoutes.trips:
        return _page(const TripPage());
      case AppRoutes.booking:
        return _page(const BookingPage());
      case AppRoutes.profile:
        return _page(const ProfilePage());

      // Auth
      case AppRoutes.login:
        return _page(const LoginPage());
      case AppRoutes.register:
        return _page(const RegisterPage());
      case AppRoutes.forgotPassword:
        return _page(const ForgotPasswordPage());
      case AppRoutes.enterVerificationCode:
        return _page(const EnterVerificationCodePage());
      case AppRoutes.resetPasswordSuccess:
        return _page(const ResetPasswordSuccessPage());

      // Booking
      case AppRoutes.bookingSearchResult:
        return _page(const BookingSearchResultPage());
      case AppRoutes.bookingConfirm:
        return _page(const BookingConfirmPage());
      case AppRoutes.bookingSuccess:
        return _page(const BookingSuccessPage());

      // Profile
      case AppRoutes.languagePage:
        return _page(const LanguagePage());

      default:
        return _page(NotFoundPage());
    }
  }

  static MaterialPageRoute _page(Widget page) {
    return MaterialPageRoute(builder: (_) => page);
  }
}
