import 'package:flutter/material.dart';
import 'package:first_app/theme/app_fonts.dart';

class LessonMenuConfig {
  final String label;
  final IconData icon;
  final Color backgroundColor;
  final Color iconColor;
  final int angle;
  final double right;
  final double fontSize;
  final double bottom;
  final bool isFullWidth;

  const LessonMenuConfig({
    required this.label,
    required this.icon,
    required this.backgroundColor,
    required this.iconColor,
    this.angle = 30,
    this.right = -40,
    this.fontSize = AppFonts.fontMedium,
    this.bottom = -20,
    this.isFullWidth = false,
  });
}
