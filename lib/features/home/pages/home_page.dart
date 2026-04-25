// d:\VS Code\flutter\first_app\lib\features\home\pages\home_page.dart

import 'package:first_app/features/home/widgets/lessonGrid/lesson_menu.dart';
import 'package:first_app/features/home/widgets/homeTask/home_task.dart';
import 'package:first_app/theme/app_colors.dart';
import 'package:first_app/theme/app_sizing.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    // final singleButtonData = DynamicButtonModel(
    //   label: "Testing",
    //   backgroundColor: Colors.blue,
    //   borderColor: Colors.white,
    //   shadowColor: Colors.black12,
    // );

    return Container(
      decoration: BoxDecoration(color: AppColors.white),
      child: SingleChildScrollView(
        padding: EdgeInsets.symmetric(
          horizontal: AppSizing.paddingMD,
          vertical: AppSizing.paddingLG,
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          spacing: 20,
          children: [
            // DynamicButton(config: singleButtonData),
            LessonMenu(),
            HomeTask(),
          ],
        ),
      ),
    );
  }
}
