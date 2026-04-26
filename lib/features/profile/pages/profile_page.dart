import 'package:first_app/features/about/pages/about_page.dart';
import 'package:first_app/features/profile/models/user_statistic.dart';
import 'package:first_app/features/profile/widgets/profile_card.dart';
import 'package:first_app/theme/app_colors.dart';
import 'package:first_app/theme/app_fonts.dart';
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
          _buildAboutButton(
            context,
            icon: Icons.info_outline_rounded,
            title: 'Tentang Kami',
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const AboutPage()),
              );
            },
          ),
        ],
      ),
    );
  }

  Widget _buildAboutButton(
    BuildContext context, {
    required IconData icon,
    required String title,
    required VoidCallback onTap,
  }) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 5),
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.circular(15),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.05),
            blurRadius: 10,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: ListTile(
        leading: Icon(icon, color: AppColors.red),
        title: Text(
          title,
          style: const TextStyle(
            fontSize: AppFonts.fontMedium,
            fontWeight: FontWeight.w600,
            color: AppColors.black,
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
