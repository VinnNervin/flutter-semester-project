import 'package:first_app/theme/app_colors.dart';
import 'package:flutter/material.dart';

class MainButtonConfig {
  final String label;
  final double fontSize;
  final int fontWeight;
  final double borderWidth;
  final Color borderColor;
  final Color shadowColor;
  final Color backgroundColor;
  final Color fontColor;
  final double width;
  final double height;
  final VoidCallback? onPressed;

  const MainButtonConfig({
    this.label = "",
    this.fontColor = AppColors.white,
    this.fontSize = 20,
    this.fontWeight = 700,
    this.backgroundColor = AppColors.primary,
    this.borderColor = const Color.fromARGB(255, 235, 235, 235),
    this.shadowColor = const Color.fromARGB(128, 151, 151, 151),
    this.height = 65,
    this.width = double.infinity,
    this.borderWidth = 0,
    this.onPressed,
  });
}
