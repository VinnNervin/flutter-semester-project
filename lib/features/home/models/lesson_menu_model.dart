import 'package:flutter/material.dart';

class LessonMenuModel {
  final String label;
  final IconData icon;
  final Color backgroundColor;
  final Color iconColor;
  final int angle;
  final double right;
  final double bottom;
  final bool isFullWidth;

  const LessonMenuModel({
    required this.label,
    required this.icon,
    required this.backgroundColor,
    required this.iconColor,
    this.angle = 30,
    this.right = -40,
    this.bottom = -20,
    this.isFullWidth = false,
  });
}
