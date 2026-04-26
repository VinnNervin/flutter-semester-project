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
  final IconData? icon;
  final Color? iconColor;
  final double iconSize;

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
    this.icon,
    this.iconColor,
    this.iconSize = 24,
  });

  MainButtonConfig copyWith({
    String? label,
    double? fontSize,
    int? fontWeight,
    double? borderWidth,
    Color? borderColor,
    Color? shadowColor,
    Color? backgroundColor,
    Color? fontColor,
    double? width,
    double? height,
    VoidCallback? onPressed,
    IconData? icon,
    Color? iconColor,
    double? iconSize,
  }) {
    return MainButtonConfig(
      label: label ?? this.label,
      fontSize: fontSize ?? this.fontSize,
      fontWeight: fontWeight ?? this.fontWeight,
      borderWidth: borderWidth ?? this.borderWidth,
      borderColor: borderColor ?? this.borderColor,
      shadowColor: shadowColor ?? this.shadowColor,
      backgroundColor: backgroundColor ?? this.backgroundColor,
      fontColor: fontColor ?? this.fontColor,
      width: width ?? this.width,
      height: height ?? this.height,
      icon: icon ?? this.icon,
      iconColor: iconColor ?? this.iconColor,
      iconSize: iconSize ?? this.iconSize,
    );
  }
}
