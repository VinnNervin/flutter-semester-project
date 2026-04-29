import 'package:first_app/features/auth/controllers/auth_controller.dart';
import 'package:first_app/features/auth/widgets/login_form.dart';
import 'package:flutter/material.dart';

class SignInPage extends StatefulWidget {
  const SignInPage({super.key});

  @override
  State<SignInPage> createState() => _SignInPageState();
}

class _SignInPageState extends State<SignInPage> {
  final AuthController _controller = AuthController();

  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  void _handleSignIn() async {
    final success = await _controller.login(
      emailController.text,
      passwordController.text,
    );

    if (success) {
      Navigator.popAndPushNamed(context, '/home');
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Login failed. Check your email or password'),
        ),
      );
    }

    setState(() {});
  }

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
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
        child: SingleChildScrollView(
          child: LoginForm(
            emailController: emailController,
            passwordController: passwordController,
            onSubmit: _handleSignIn,
          ),
        ),
      ),
    );
  }
}
