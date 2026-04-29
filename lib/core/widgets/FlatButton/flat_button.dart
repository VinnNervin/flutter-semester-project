import 'package:first_app/theme/app_colors.dart';
import 'package:first_app/theme/app_fonts.dart';
import 'package:flutter/material.dart';

class FlatButtonConfig {
  final IconData? icon;
  final Color textColor;
  final Color iconColor;
  final Color borderColor;
  final double borderWidth;
  final bool enableShadow;

  const FlatButtonConfig({
    this.icon,
    this.textColor = AppColors.black,
    this.iconColor = AppColors.primary,
    this.borderColor = AppColors.grey,
    this.borderWidth = 1,
    this.enableShadow = false,
  });
}

class FlatButton extends StatelessWidget {
  final FlatButtonConfig? config;
  final String label;
  final VoidCallback? onTap;

  const FlatButton({super.key, this.config, required this.label, this.onTap});

  @override
  Widget build(BuildContext context) {
    final effectiveConfig = config ?? const FlatButtonConfig();

    return Container(
      margin: const EdgeInsets.symmetric(vertical: 6),
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.circular(15),
        boxShadow: effectiveConfig.enableShadow
            ? [
                BoxShadow(
                  color: Colors.black.withValues(alpha: 0.05),
                  blurRadius: 10,
                  offset: const Offset(0, 4),
                ),
              ]
            : null,
        border: Border.all(
          color: effectiveConfig.borderColor,
          width: effectiveConfig.borderWidth,
        ),
      ),
      child: ListTile(
        leading: effectiveConfig.icon != null
            ? Icon(effectiveConfig.icon, color: effectiveConfig.iconColor)
            : null,
        title: Text(
          label,
          style: TextStyle(
            fontSize: AppFonts.fontMedium,
            fontWeight: FontWeight.w600,
            color: effectiveConfig.textColor,
          ),
        ),
        trailing: const Icon(
          Icons.chevron_right_rounded,
          color: AppColors.grey,
        ),
        onTap: onTap,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
      ),
    );
  }
}
