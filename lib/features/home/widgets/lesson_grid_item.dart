import 'package:first_app/theme/app_colors.dart';
import 'package:flutter/material.dart';
import 'dart:math' as math;

class LessonGridItem extends StatelessWidget {
  final double right;
  final double bottom;
  final int angle;
  final Color iconColor;
  final String label;
  final IconData icon;
  final bool isFullWidth;

  const LessonGridItem({
    super.key,
    required this.right,
    required this.bottom,
    required this.angle,
    required this.label,
    required this.iconColor,
    required this.icon,
    this.isFullWidth = false,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.bottomLeft,
      children: [
        Positioned(
          right: right,
          bottom: bottom,
          child: Transform.rotate(
            angle: angle * (math.pi / 180), // Rotasi 45 Derajat
            child: Icon(icon, size: 150, color: iconColor),
          ),
        ),

        Container(
          padding: EdgeInsets.all(20),
          child: Text(
            label,
            style: TextStyle(
              fontSize: 16,
              color: AppColors.white,
              fontWeight: FontWeight.w900,
            ),
          ),
        ),
      ],
    );
  }
}
