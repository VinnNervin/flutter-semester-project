import 'package:first_app/theme/app_colors.dart';
import 'package:flutter/material.dart';

class AppBarText extends StatelessWidget implements PreferredSizeWidget {
  const AppBarText({super.key, required this.label});
  final String label;

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Text(label, style: TextStyle(fontWeight: FontWeight.bold)),
      backgroundColor: Colors.transparent,
      elevation: 0,
      foregroundColor: AppColors.black,
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(50);
}
