import 'package:first_app/core/widgets/FlatButton/flat_button.dart';
import 'package:first_app/features/about/pages/about_page.dart';
import 'package:first_app/features/setting/pages/setting_page.dart';
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
        children: [
          ProfileCard(userStatisticProfile: userStatisticProfile),
          const SizedBox(height: 20),
          FlatButton(
            label: 'Tentang Kami',
            config: const FlatButtonConfig(icon: Icons.info),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const AboutPage()),
              );
            },
          ),
          FlatButton(
            label: 'Pengaturan',
            config: const FlatButtonConfig(icon: Icons.settings),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const SettingPage()),
              );
            },
          ),
        ],
      ),
    );
  }
}
