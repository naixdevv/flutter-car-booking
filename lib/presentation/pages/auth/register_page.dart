import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lucide_icons_flutter/lucide_icons.dart';
import 'package:flutter_car_booking/core/theme/app_colors.dart';
import 'package:flutter_car_booking/core/utils/formatters.dart';
import 'package:flutter_car_booking/presentation/widgets/app_button.dart';
import 'package:flutter_car_booking/presentation/widgets/app_text_button.dart';
import 'package:flutter_car_booking/presentation/widgets/app_textfield.dart';
import 'package:flutter_car_booking/presentation/pages/auth/bloc/auth_bloc.dart';
import 'package:flutter_car_booking/presentation/pages/auth/bloc/auth_event.dart';
import 'package:flutter_car_booking/presentation/pages/auth/bloc/auth_state.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  final _formKey = GlobalKey<FormState>();
  final usernameController = TextEditingController();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final confirmPasswordController = TextEditingController();

  @override
  void dispose() {
    usernameController.clear();
    emailController.clear();
    passwordController.clear();
    confirmPasswordController.clear();
    super.dispose();
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
        child: BlocConsumer<AuthBloc, AuthState>(
          listener: (context, state) {
            if (state.isSuccess) {
              Navigator.pop(context);
            }
            if (state.error != null) {
              // Alert Error
            }
          },
          builder: (context, state) {
            return Padding(
              padding: EdgeInsets.all(24),
              child: Form(
                key: _formKey,
                child: ListView(
                  physics: BouncingScrollPhysics(),
                  children: [
                    Center(
                      child: Column(
                        children: [
                          Text(
                            'Create New Account',
                            style: TextStyle(
                              color: AppColors.textPrimary,
                              fontSize: 24,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          SizedBox(height: 8),
                          Text(
                            'Set up your username and password. \n You can always change it later.',
                            style: TextStyle(color: AppColors.textSecondary),
                            textAlign: TextAlign.center,
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: 24),
                    AppTextField(
                      controller: usernameController,
                      hintText: 'Username',
                      prefixIcon: Icon(
                        LucideIcons.user,
                        color: AppColors.iconPrimary,
                      ),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Username cannot be empty';
                        }
                        return null;
                      },
                    ),
                    SizedBox(height: 16),
                    AppTextField(
                      controller: emailController,
                      hintText: 'Email',
                      keyboardType: TextInputType.emailAddress,
                      prefixIcon: Icon(
                        LucideIcons.mail,
                        color: AppColors.iconPrimary,
                      ),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Email cannot be empty';
                        }
                        if (!AppFormatters.isValidEmail(value)) {
                          return 'Invalid email format';
                        }
                        return null;
                      },
                    ),
                    SizedBox(height: 16),
                    AppTextField(
                      controller: passwordController,
                      hintText: 'Password',
                      obscureText: true,
                      prefixIcon: Icon(
                        LucideIcons.lockKeyhole,
                        color: AppColors.iconPrimary,
                      ),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Password cannot be empty';
                        }
                        if (value.length < 6) {
                          return 'Password must be at least 6 characters';
                        }
                        return null;
                      },
                    ),
                    SizedBox(height: 16),
                    AppTextField(
                      controller: confirmPasswordController,
                      hintText: 'Confirm Password',
                      obscureText: true,
                      prefixIcon: Icon(
                        LucideIcons.lockKeyhole,
                        color: AppColors.iconPrimary,
                      ),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Confirm Password cannot be empty';
                        }
                        if (value != passwordController.text) {
                          return 'Password not match';
                        }
                        return null;
                      },
                    ),
                    SizedBox(height: 24),
                    AppButton(
                      text: 'Sign Up',
                      onPressed: () {
                        if (_formKey.currentState!.validate()) {
                          context.read<AuthBloc>().add(RegisterEvent(usernameController.text, emailController.text, passwordController.text));
                        }
                      },
                      type: ButtonType.primary,
                      isLoading: state.isLoading,
                    ),
                    SizedBox(height: 16),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'Already have an account?',
                          style: TextStyle(
                            color: AppColors.textPrimary,
                            fontSize: 16,
                          ),
                        ),
                        SizedBox(height: 4),
                        AppTextButton(
                          text: 'Log in',
                          onPressed: () {
                            Navigator.pop(context);
                          },
                        ),
                      ],
                    ),
                    SizedBox(height: 24),
                    Row(
                      children: [
                        Expanded(
                          child: Divider(
                            color: AppColors.borderSecondary,
                            thickness: 1,
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 8.0),
                          child: Text(
                            'Or sign in with',
                            style: TextStyle(
                              color: AppColors.textPrimary,
                              fontSize: 16,
                            ),
                          ),
                        ),
                        Expanded(
                          child: Divider(
                            color: AppColors.borderSecondary,
                            thickness: 1,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 16),
                    Row(
                      children: [
                        Expanded(
                          child: AppButton(
                            text: 'Google',
                            onPressed: () {},
                            type: ButtonType.google,
                          ),
                        ),
                        SizedBox(width: 16),
                        Expanded(
                          child: AppButton(
                            text: 'Facebook',
                            onPressed: () {},
                            type: ButtonType.facebook,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            );
          }
        ),
      ),
    );
  }
}
