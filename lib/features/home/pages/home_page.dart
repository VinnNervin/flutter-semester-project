// d:\VS Code\flutter\first_app\lib\features\home\pages\home_page.dart

import 'package:first_app/core/widgets/DynamicButton/Dynamic_Button.dart';
import 'package:first_app/core/widgets/DynamicButton/dynamic_button_model.dart';
import 'package:first_app/features/home/widgets/lesson_menu.dart';
import 'package:first_app/features/home/widgets/task_component.dart';
import 'package:first_app/theme/app_colors.dart';
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
      padding: EdgeInsets.all(16),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(25),
          bottomRight: Radius.circular(25),
        ),
        color: AppColors.white,
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        spacing: 20,
        children: [
          // DynamicButton(model: singleButtonData),
          LessonMenu(),
          TaskComponent(),
        ],
      ),
    );
  }
}
