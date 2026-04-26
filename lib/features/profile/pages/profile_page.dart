import 'package:first_app/features/profile/models/user_statistic.dart';
import 'package:first_app/features/profile/widgets/profile_card.dart';
import 'package:first_app/theme/app_sizing.dart';
import 'package:flutter/material.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    const jsonData = {'xp': 200, 'followers': 400, 'streak': 12};
    final userStatisticProfile = UserStatistic.fromJson(jsonData);

    return Container(
      width: double.infinity,
      padding: EdgeInsets.symmetric(horizontal: AppSizing.paddingXS),
      child: Column(
        children: [ProfileCard(userStatisticProfile: userStatisticProfile)],
      ),
    );
  }
}
