import 'dart:math';

import 'package:first_app/core/widgets/MainButton/main_button_model.dart';
import 'package:first_app/theme/app_colors.dart';
import 'package:flutter/material.dart';

class MainButton extends StatefulWidget {
  final MainButtonModel model;

  const MainButton({super.key, required this.model});

  @override
  State<MainButton> createState() => _MainButtonState();
}

class _MainButtonState extends State<MainButton> {
  // 1. State untuk melacak apakah sedang ditekan
  bool _isPressed = false;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      behavior: HitTestBehavior.opaque,
      // 2. Deteksi sentuhan
      onTapDown: (_) => setState(() => _isPressed = true),
      onTapUp: (_) => setState(() => _isPressed = false),
      onTapCancel: () => setState(() => _isPressed = false),
      onTap: () {
        if (widget.model.onPressed != null) {
          widget.model.onPressed!();
        }
      },
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 100), // Durasi transisi
        curve: Curves.easeOut,
        width: widget.model.width,
        height: widget.model.height,
        // 3. Jarak efek bergerak animasi (WAJIB SAMA DENGAN OFFSET Y DI BAWAH)
        transform: Matrix4.translationValues(0, _isPressed ? 4 : 0, 0),
        decoration: BoxDecoration(
          color: widget.model.backgroundColor,
          // Mencegah border hairline 1px jika ukurannya diseting 0 di model
          border: widget.model.borderWidth > 0
              ? Border.all(
                  color: widget.model.borderColor,
                  width: widget.model.borderWidth,
                )
              : null,
          borderRadius: BorderRadius.circular(20),
          boxShadow: _isPressed
              ? []
              : [
                  BoxShadow(
                    color: widget.model.shadowColor,
                    offset: const Offset(0, 4), // Offset bayangan Y yaitu 4
                    blurRadius: 0,
                  ),
                ],
        ),
        child: Center(
          child: Text(
            widget.model.label,
            style: TextStyle(
              fontWeight: FontWeight(widget.model.fontWeight),
              fontSize: widget.model.fontSize,
              color: widget.model.fontColor,
            ),
          ),
        ),
      ),
    );
  }
}
