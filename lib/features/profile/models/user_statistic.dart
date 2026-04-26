import 'package:first_app/theme/app_colors.dart';
import 'package:flutter/material.dart';

class StatItem {
  final String label;
  final String value;
  final Color color;

  StatItem({
    required this.label,
    required this.value,
    required this.color,
  });
}

class UserStatistic {
  final int xp;
  final int followers;
  final int streak;

  const UserStatistic({
    required this.xp,
    required this.followers,
    required this.streak,
  });

  List<StatItem> get statsList => [
    StatItem(label: 'XP', value: xp.toString(), color: AppColors.red),
    StatItem(
      label: 'FOLLOWERS',
      value: followers.toString(),
      color: AppColors.orange,
    ),
    StatItem(
      label: 'STREAK',
      value: streak.toString(),
      color: AppColors.secondary,
    ),
  ];

  factory UserStatistic.fromJson(Map<String, dynamic> json) {
    return UserStatistic(
      xp: json['xp'] as int,
      followers: json['followers'] as int,
      streak: json['streak'] as int,
    );
  }

  Map<String, dynamic> toJson() {
    return {'xp': xp, 'followers': followers, 'streak': streak};
  }
}
