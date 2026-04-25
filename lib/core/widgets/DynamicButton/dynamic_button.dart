import 'dart:math';

import 'package:first_app/core/widgets/DynamicButton/dynamic_button_model.dart';
import 'package:first_app/theme/app_colors.dart';
import 'package:flutter/material.dart';

enum ButtonType { gold, normal }

class DynamicButton extends StatefulWidget {
  final DynamicButtonModel model;

  const DynamicButton({super.key, required this.model});

  @override
  State<DynamicButton> createState() => _DynamicButtonState();
}

class _DynamicButtonState extends State<DynamicButton> {
  // 1. State untuk melacak apakah sedang ditekan
  bool _isPressed = false;

  @override
  Widget build(BuildContext context) {
    return Listener(
      // 1. Tangkap sentuhan secara instan sebelum di-delay oleh ScrollView
      onPointerDown: (_) => setState(() => _isPressed = true),
      onPointerUp: (_) => setState(() => _isPressed = false),
      child: GestureDetector(
        behavior: HitTestBehavior.opaque,
        // 2. onTapCancel penting agar bila user berniat men-scroll, tombol tidak nyangkut posisi tertekan
        onTapCancel: () => setState(() => _isPressed = false),
        onTap: () {
          if (widget.model.onPressed != null) {
            widget.model.onPressed!();
          }
        },
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 100), // Durasi transisi
          curve: Curves.easeOut,
          width: 10,
          height: 150,
          // 3. Efek Bergerak ke Bawah saat ditekan (Wajib disamakan dengan Offset shadow = 8)
          transform: Matrix4.translationValues(0, _isPressed ? 8 : 0, 0),
          clipBehavior: Clip.hardEdge,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            // 4. Bayangan akan hilang ssaat ditekan
            boxShadow: _isPressed
                ? []
                : [
                    BoxShadow(
                      color: widget.model.isGoldButton
                          ? AppColors.orangeAccent
                          : widget.model.shadowColor,
                      offset: const Offset(0, 8),
                      blurRadius: 0,
                    ),
                  ],
          ),
          child: Stack(
            children: [
              // BOX UTAMA
              Container(
                decoration: BoxDecoration(
                  color: widget.model.isGoldButton
                      ? AppColors.orangeAccent
                      : widget.model.backgroundColor,
                  border: Border.all(
                    color: widget.model.isGoldButton
                        ? AppColors.orange
                        : widget.model.borderColor,
                    width: 7,
                  ),
                  borderRadius: BorderRadius.circular(20),
                ),
                padding: EdgeInsets.only(top: 60, left: 10),
                width: double.infinity,
                height: double.infinity,
                child: Text(
                  widget.model.label,
                  style: TextStyle(
                    fontWeight: FontWeight(widget.model.fontWeight),
                    fontSize: widget.model.fontSize,
                    color: widget.model.isGoldButton
                        ? AppColors.orange
                        : widget.model.fontColor,
                  ),
                ),
              ),

              if (widget.model.isGoldButton)
                Positioned(
                  top: 15,
                  left: -30,
                  child: Transform.rotate(
                    angle: -35 * (pi / 180),
                    child: Container(
                      width: 150,
                      height: 30,
                      decoration: BoxDecoration(
                        color: Colors.white.withAlpha(100),
                      ),
                    ),
                  ),
                ),

              if (widget.model.isGoldButton)
                Positioned(
                  bottom: 0,
                  right: -30,
                  child: Transform.rotate(
                    angle: -35 * (pi / 180),
                    child: Container(
                      width: 150,
                      height: 10,
                      decoration: BoxDecoration(
                        color: Colors.white.withAlpha(100),
                      ),
                    ),
                  ),
                ),
            ],
          ),
        ),
      ),
    );
  }
}
