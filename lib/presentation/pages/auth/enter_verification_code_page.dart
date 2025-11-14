import 'package:flutter/material.dart';
import 'package:lucide_icons_flutter/lucide_icons.dart';
import 'package:flutter_car_booking/core/theme/app_colors.dart';
import 'package:flutter_car_booking/presentation/widgets/app_button.dart';
import 'package:flutter_car_booking/presentation/widgets/otp_input.dart';

class EnterVerificationCodePage extends StatefulWidget {
  const EnterVerificationCodePage({super.key});

  @override
  State<EnterVerificationCodePage> createState() =>
      _EnterVerificationCodePageState();
}

class _EnterVerificationCodePageState extends State<EnterVerificationCodePage> {
  final controllers = List.generate(5, (_) => TextEditingController());

  void _verify(String otp) {
    Navigator.pop(context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(LucideIcons.chevronLeft, color: Colors.white),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        backgroundColor: AppColors.backgroundPrimary,
      ),
      backgroundColor: AppColors.backgroundPrimary,
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.all(24),
          child: ListView(
            physics: BouncingScrollPhysics(),
            children: [
              Center(
                child: Column(
                  children: [
                    Text(
                      'Enter Verification Code',
                      style: TextStyle(
                        color: AppColors.textPrimary,
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: 8),
                    Text(
                      'We have sent the code verification to your Email Address',
                      style: TextStyle(color: AppColors.textSecondary),
                      textAlign: TextAlign.center,
                    ),
                  ],
                ),
              ),
              SizedBox(height: 24),
              OtpInput(
                controllers: controllers,
                onCompleted: (otp) {
                  _verify(otp);
                },
              ),
              SizedBox(height: 24),
              AppButton(
                text: 'Verify',
                onPressed: () {},
                type: ButtonType.primary,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
