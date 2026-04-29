import 'package:first_app/core/widgets/AppBarText/app_bar_text.dart';
import 'package:first_app/core/widgets/FlatButton/flat_button.dart';
import 'package:first_app/features/setting/models/setting_item_model.dart';
import 'package:first_app/theme/app_colors.dart';
import 'package:first_app/theme/app_sizing.dart';
import 'package:flutter/material.dart';

class SettingPage extends StatelessWidget {
  const SettingPage({super.key});

  @override
  Widget build(BuildContext context) {
    final List<SettingItemModel> settings = [
      SettingItemModel(
        label: 'Edit Profil',
        icon: Icons.person_outline,
        onTap: () {},
      ),
      SettingItemModel(label: 'Bahasa', icon: Icons.language, onTap: () {}),
      SettingItemModel(
        label: 'Notifikasi',
        icon: Icons.notifications_none,
        onTap: () {},
      ),
      SettingItemModel(label: 'Keamanan', icon: Icons.security, onTap: () {}),
      SettingItemModel(
        label: 'Keluar',
        icon: Icons.logout,
        color: AppColors.red,
        onTap: () {
          Navigator.pushNamedAndRemoveUntil(context, '/', (route) => false);
        },
      ),
    ];

    return Scaffold(
      backgroundColor: AppColors.white,
      appBar: AppBarText(label: 'Pengaturan'),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(AppSizing.paddingSM),
        child: Column(
          children: settings.map((item) {
            return FlatButton(
              label: item.label,
              onTap: item.onTap,
              config: FlatButtonConfig(
                icon: item.icon,
                iconColor: item.color ?? AppColors.primary,
                textColor: item.color ?? AppColors.black,
              ),
            );
          }).toList(),
        ),
      ),
    );
  }
}
