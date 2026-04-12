import 'package:first_app/core/layout/main_layout.dart';
import 'package:first_app/features/auth/pages/sign_in_page.dart';
import 'package:first_app/features/auth/pages/sign_up_page.dart';
import 'package:flutter/material.dart';

class AppRoutes {
  static const initial = '/';

  static final routes = <String, WidgetBuilder>{
    "/": (_) => const SignInPage(),
    "/signup": (context) => const SignUpPage(),
    "/home": (_) => const MainLayout(),
  };
}
