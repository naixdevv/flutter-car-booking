import 'package:flutter/material.dart';
import 'package:flutter_car_booking/core/theme/app_colors.dart';

class OtpInput extends StatelessWidget {
  final List<TextEditingController> controllers;
  final void Function(String) onCompleted;

  const OtpInput({
    super.key,
    required this.controllers,
    required this.onCompleted,
  }) : assert(controllers.length == 5, 'ต้องมี 5 controllers');

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      spacing: 16,
      children: List.generate(5, (index) {
        return Expanded(
          child: TextField(
            controller: controllers[index],
            keyboardType: TextInputType.number,
            textAlign: TextAlign.center,
            maxLength: 1,
            style: TextStyle(
              color: AppColors.inputText,
              fontSize: 24,
              fontWeight: FontWeight.bold,
            ),
            decoration: InputDecoration(
              counterText: '',
              filled: true,
              fillColor: AppColors.inputPrimary,
              contentPadding: EdgeInsets.symmetric(
                horizontal: 16,
                vertical: 18,
              ),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(16),
                borderSide: BorderSide.none,
              ),
            ),
            onChanged: (value) {
              if (value.length == 1 && index < 4) {
                FocusScope.of(context).nextFocus();
              } else if (value.isEmpty && index > 0) {
                FocusScope.of(context).previousFocus();
              }

              String otp = controllers.map((c) => c.text).join();
              if (otp.length == 5) {
                onCompleted(otp);
              }
            },
          ),
        );
      }),
    );
  }
}
