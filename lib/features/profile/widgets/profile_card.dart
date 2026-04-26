import 'package:first_app/core/widgets/ImageBox/image_box.dart';
import 'package:first_app/core/widgets/MainButton/main_button.dart';
import 'package:first_app/core/widgets/MainButton/main_button_config.dart';
import 'package:first_app/features/profile/models/user_statistic.dart';
import 'package:first_app/theme/app_colors.dart';
import 'package:first_app/theme/app_fonts.dart';
import 'package:flutter/material.dart';
import 'package:lucide_icons_flutter/lucide_icons.dart';

class ProfileCard extends StatelessWidget {
  final UserStatistic userStatisticProfile;
  const ProfileCard({super.key, required this.userStatisticProfile});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 15, vertical: 20),

      clipBehavior: Clip.hardEdge,
      decoration: BoxDecoration(
        border: Border.all(color: AppColors.white, width: 10),
        borderRadius: BorderRadius.all(Radius.circular(25)),
        boxShadow: [
          BoxShadow(
            color: AppColors.black.withValues(alpha: 0.2),
            spreadRadius: 2,
            offset: Offset(0, 4),
          ),
        ],
        color: AppColors.primary,
      ),
      child: Column(
        children: [
          // name + profile
          SizedBox(height: 20),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Charles Lin",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: AppColors.white,
                      fontSize: AppFonts.fontXLarge,
                    ),
                  ),
                  Text(
                    '@chrles_lin229',
                    style: TextStyle(color: AppColors.white),
                  ),
                  Text(
                    '@Indonesia | Pelajar',
                    style: TextStyle(color: AppColors.white),
                  ),
                ],
              ),
              ImageBox.network(
                "https://i.pravatar.cc/150?img=12",
                config: ImageBoxConfig(width: 80, height: 80, borderWidth: 4),
              ),
            ],
          ),
          // statistic
          SizedBox(height: 20),
          Container(
            clipBehavior: Clip.hardEdge,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(10)),
            ),
            child: Row(
              children: [
                for (var stat in userStatisticProfile.statsList)
                  Expanded(
                    child: Container(
                      color: stat.color,
                      padding: EdgeInsets.symmetric(
                        horizontal: 10,
                        vertical: 10,
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            stat.value,
                            style: TextStyle(
                              color: AppColors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: AppFonts.fontMedium,
                            ),
                          ),
                          Text(
                            stat.label,
                            style: TextStyle(
                              color: AppColors.white,
                              fontWeight: FontWeight.w800,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
              ],
            ),
          ),

          // button share
          SizedBox(height: 20),

          MainButton.icon(
            icon: LucideIcons.share,
            config: MainButtonConfig(
              label: 'SHARE',
              fontWeight: 900,
              fontColor: AppColors.primary,
              backgroundColor: AppColors.white,
            ),
          ),
        ],
      ),
    );
  }
}
