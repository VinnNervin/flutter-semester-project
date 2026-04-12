import 'package:first_app/theme/app_colors.dart';
import 'package:flutter/material.dart';

class DynamicButtonModel {
  final String label;
  final double fontSize;
  final int fontWeight;
  final Color borderColor;
  final Color shadowColor;
  final Color backgroundColor;
  final Color fontColor;
  final bool isGoldButton;
  final VoidCallback? onPressed;

  const DynamicButtonModel({
    this.label = "",
    this.fontColor = AppColors.white,
    this.fontSize = 20,
    this.fontWeight = 700,
    this.backgroundColor = AppColors.primary,
    this.borderColor = const Color.fromARGB(255, 235, 235, 235),
    this.shadowColor = Colors.black,
    this.isGoldButton = false,
    this.onPressed,
  });
}
