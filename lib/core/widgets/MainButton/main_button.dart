import 'package:first_app/core/widgets/MainButton/main_button_config.dart';
import 'package:flutter/material.dart';

class MainButton extends StatefulWidget {
  final MainButtonConfig config;

  const MainButton({super.key, required this.config});

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
        if (widget.config.onPressed != null) {
          widget.config.onPressed!();
        }
      },
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 100), // Durasi transisi
        curve: Curves.easeOut,
        width: widget.config.width,
        height: widget.config.height,
        // 3. Jarak efek bergerak animasi (WAJIB SAMA DENGAN OFFSET Y DI BAWAH)
        transform: Matrix4.translationValues(0, _isPressed ? 4 : 0, 0),
        decoration: BoxDecoration(
          color: widget.config.backgroundColor,
          // Mencegah border hairline 1px jika ukurannya diseting 0 di config
          border: widget.config.borderWidth > 0
              ? Border.all(
                  color: widget.config.borderColor,
                  width: widget.config.borderWidth,
                )
              : null,
          borderRadius: BorderRadius.circular(20),
          boxShadow: _isPressed
              ? []
              : [
                  BoxShadow(
                    color: widget.config.shadowColor,
                    offset: const Offset(0, 4), // Offset bayangan Y yaitu 4
                    blurRadius: 0,
                  ),
                ],
        ),
        child: Center(
          child: Text(
            widget.config.label,
            style: TextStyle(
              fontWeight: FontWeight(widget.config.fontWeight),
              fontSize: widget.config.fontSize,
              color: widget.config.fontColor,
            ),
          ),
        ),
      ),
    );
  }
}
