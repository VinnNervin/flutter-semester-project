import 'package:first_app/theme/app_fonts.dart';
import 'package:first_app/theme/app_sizing.dart';
import 'package:flutter/material.dart';

class IntroText extends StatelessWidget {
  const IntroText({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: [
          Text(
            'Halo Charles \n Ayo Belajar hal baru',
            textAlign: TextAlign.center,
            style: TextStyle(fontSize: AppFonts.fontXLarge),
          ),
          SizedBox(height: AppSizing.paddingSM),
        ],
      ),
    );
  }
}
