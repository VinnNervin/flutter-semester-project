import 'package:first_app/core/widgets/HomepageHeader/home_header.dart';
import 'package:first_app/features/home/widgets/lessonGrid/lesson_menu.dart';
import 'package:first_app/theme/app_colors.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(color: AppColors.white),
      child: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          spacing: 20,
          children: [HomeHeader(), LessonMenu()],
        ),
      ),
    );
  }
}
