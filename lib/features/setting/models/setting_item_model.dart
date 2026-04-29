import 'package:flutter/material.dart';

class SettingItemModel {
  final String label;
  final IconData icon;
  final VoidCallback onTap;
  final Color? color;

  const SettingItemModel({
    required this.label,
    required this.icon,
    required this.onTap,
    this.color,
  });
}
