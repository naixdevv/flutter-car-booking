import 'package:flutter/material.dart';
import 'package:flutter_car_booking/routes/app_routes.dart';
import 'package:flutter_car_booking/core/theme/app_colors.dart';
import 'package:flutter_car_booking/presentation/widgets/app_button.dart';

class ResetPasswordSuccessPage extends StatelessWidget {
  const ResetPasswordSuccessPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroundPrimary,
      body: SafeArea(
        top: false,
        child: Padding(
          padding: EdgeInsets.all(24),
          child: Center(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                SizedBox(height: 24),
                Image.asset(
                  'assets/images/success.png',
                  width: 150,
                  height: 150,
                  fit: BoxFit.contain,
                ),
                Center(
                  child: Column(
                    children: [
                      Text(
                        'your password has changed',
                        style: TextStyle(
                          color: AppColors.textPrimary,
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(height: 8),
                      Text(
                        'Don`t worry, we`ll let you know if there`s a problem with your account',
                        style: TextStyle(color: AppColors.textSecondary),
                        textAlign: TextAlign.center,
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 24),
                AppButton(
                  text: 'Back to Log in',
                  onPressed: () {
                    Navigator.pushNamedAndRemoveUntil(context, AppRoutes.login, (_) => false);
                  },
                  type: ButtonType.primary,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
