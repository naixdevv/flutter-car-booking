import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_car_booking/core/theme/app_colors.dart';

enum ButtonType { primary, google, facebook }

class AppButton extends StatelessWidget {
  final String text;
  final VoidCallback onPressed;
  final ButtonType type;

  const AppButton({
    super.key,
    required this.text,
    required this.onPressed,
    this.type = ButtonType.primary,
  });

  @override
  Widget build(BuildContext context) {
    Color backgroundColor = AppColors.buttonPrimary;
    Widget? leadingIcon;

    switch (type) {
      case ButtonType.google:
        backgroundColor = AppColors.buttonSecondary;
        leadingIcon = SvgPicture.asset(
          'assets/icons/google.svg',
          width: 24,
          height: 24,
        );
        break;
      case ButtonType.facebook:
        backgroundColor = AppColors.buttonSecondary; // Facebook blue
        leadingIcon = SvgPicture.asset(
          'assets/icons/facebook.svg',
          width: 24,
          height: 24,
        );
        break;
      case ButtonType.primary:
    }

    return SizedBox(
      height: 56,
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          backgroundColor: backgroundColor,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16),
          ),
        ),
        child: Row(
          mainAxisAlignment: leadingIcon != null
              ? MainAxisAlignment.start
              : MainAxisAlignment.center,
          children: [
            if (leadingIcon != null) ...[leadingIcon, SizedBox(width: 16)],
            Text(
              text,
              style: TextStyle(
                fontSize: 16,
                color: type == ButtonType.primary ? Colors.black : Colors.white,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
