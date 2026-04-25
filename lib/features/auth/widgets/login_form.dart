import 'package:first_app/core/widgets/MainButton/main_button.dart';
import 'package:first_app/core/widgets/MainButton/main_button_config.dart';
import 'package:first_app/features/auth/widgets/auth_textfield.dart';
import 'package:first_app/theme/app_colors.dart';
import 'package:first_app/theme/app_fonts.dart';
import 'package:flutter/material.dart';
import 'package:lucide_icons_flutter/lucide_icons.dart';

class LoginForm extends StatelessWidget {
  final TextEditingController emailController;
  final TextEditingController passwordController;
  final TextEditingController? confirmPasswordController;
  final VoidCallback onSUbmit;

  const LoginForm({
    super.key,
    required this.emailController,
    required this.passwordController,
    this.confirmPasswordController,
    required this.onSUbmit,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(50),
          topRight: Radius.circular(50),
        ),
        color: Colors.white,
      ),
      padding: EdgeInsets.only(
        top: 50,
        left: 24,
        right: 24,
        bottom: confirmPasswordController != null ? 70 : 150,
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            confirmPasswordController != null ? "Sign Up" : "Sign In",
            style: TextStyle(
              fontSize: AppFonts.fontXLarge,
              fontWeight: FontWeight.bold,
              color: AppColors.primary,
            ),
          ),
          Text.rich(
            confirmPasswordController != null
                ? TextSpan(
                    children: [
                      TextSpan(
                        text: "Welcome To ",
                        style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.normal,
                        ),
                      ),
                      TextSpan(
                        text: "Speak Up",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: AppColors.primary,
                        ),
                      ),
                    ],
                  )
                : TextSpan(text: "Welcome back"),
          ),
          const SizedBox(height: 20),
          AuthTextfield(
            controller: emailController,
            label: 'Email',
            hintText: 'Enter your email',
            keyboardType: TextInputType.emailAddress,
            autocorrect: false,
            enableSuggestions: false,
            icon: LucideIcons.mail,
          ),
          const SizedBox(height: 10),
          AuthTextfield(
            controller: passwordController,
            label: 'Password',
            hintText: 'Enter your password',
            obscureText: true,
            icon: LucideIcons.lockKeyhole,
          ),
          if (confirmPasswordController != null) ...[
            const SizedBox(height: 10),
            AuthTextfield(
              controller: confirmPasswordController!,
              label: 'Confirmation Password',
              hintText: 'Enter your password',
              obscureText: true,
              icon: LucideIcons.lockKeyhole,
            ),
          ],
          const SizedBox(height: 26),
          MainButton(
            config: MainButtonConfig(
              width: double.infinity,
              shadowColor: AppColors.primary.withValues(alpha: 0.5),
              label: (confirmPasswordController != null
                  ? "SIGN UP"
                  : "SIGN IN"),
              fontColor: Colors.white,
              onPressed: onSUbmit,
            ),
          ),
          const SizedBox(height: 16),
          GestureDetector(
            onTap: () {
              if (confirmPasswordController != null) {
                Navigator.popAndPushNamed(context, "/");
              } else {
                Navigator.popAndPushNamed(context, '/signup');
              }
            },
            child: Text.rich(
              TextSpan(
                text: confirmPasswordController != null
                    ? "Have an account? "
                    : "Don't have an account? ",
                style: const TextStyle(color: Colors.black),
                children: [
                  TextSpan(
                    text: confirmPasswordController != null
                        ? "Sign In"
                        : "Sign Up",
                    style: TextStyle(
                      color: AppColors.primary,
                      fontWeight: FontWeight.w900,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
