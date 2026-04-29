import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'routes.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'flutter app',
      debugShowCheckedModeBanner: false,
      initialRoute: AppRoutes.initial,
      theme: ThemeData(
        useMaterial3: true, 
        textTheme: GoogleFonts.geologicaTextTheme(),
      ),
      routes: AppRoutes.routes,
    );
  }
}
