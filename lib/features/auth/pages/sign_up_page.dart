import 'package:first_app/features/auth/controllers/auth_controller.dart';
import 'package:first_app/features/auth/widgets/login_form.dart';
import 'package:flutter/material.dart';

class SignUpPage extends StatefulWidget {
  const SignUpPage({super.key});

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  final AuthController _controller = AuthController();

  final nameController = TextEditingController();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final confirmPasswordController = TextEditingController();

  void _handleSignUp() async {
    final success = await _controller.signUp(
      nameController.text,
      emailController.text,
      confirmPasswordController.text,
      passwordController.text,
    );

    if (success) {
      // Navigator.popAndPushNamed(context, '/');
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(const SnackBar(content: Text('Sign Up success')));
    } else {
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(const SnackBar(content: Text('login failed')));
    }

    setState(() {});
  }

  @override
  void dispose() {
    nameController.dispose();
    emailController.dispose();
    passwordController.dispose();
    confirmPasswordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/images/login-image.png'),
            fit: BoxFit.cover,
          ),
        ),
        height: double.infinity,
        alignment: Alignment.bottomCenter,
        child: LoginForm(
          nameController: nameController,
          emailController: emailController,
          passwordController: passwordController,
          confirmPasswordController: confirmPasswordController,
          onSubmit: _handleSignUp,
        ),
      ),
    );
  }
}
