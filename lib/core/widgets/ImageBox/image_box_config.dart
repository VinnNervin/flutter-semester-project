import 'package:first_app/theme/app_colors.dart';
import 'package:flutter/material.dart';

class ImageBoxConfig {
  final double width;
  final double height;
  final double radius;
  final Color borderColor;
  final double borderWidth;

  const ImageBoxConfig({
    this.width = 50,
    this.height = 50,
    this.radius = 50,
    this.borderColor = AppColors.white,
    this.borderWidth = 0,
  });
}
