import 'package:flutter/material.dart';
import 'package:first_app/theme/app_colors.dart';
import 'package:first_app/theme/app_fonts.dart';
import 'package:first_app/theme/app_sizing.dart';

class AboutPage extends StatelessWidget {
  const AboutPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      appBar: AppBar(
        title: const Text(
          'Tentang Kami',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        backgroundColor: Colors.transparent,
        elevation: 0,
        foregroundColor: AppColors.black,
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(AppSizing.paddingMD),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              'SpeakUp',
              style: TextStyle(
                fontSize: AppFonts.fontXLarge,
                fontWeight: FontWeight.bold,
                color: AppColors.primary,
                letterSpacing: 1.2,
              ),
            ),
            Text(
              'Aplikasi Belajar Bahasa',
              style: TextStyle(
                fontSize: AppFonts.fontMedium,
                color: AppColors.black.withValues(alpha: 0.7),
                fontStyle: FontStyle.italic,
              ),
            ),
            const SizedBox(height: 40),

            // Group Section
            _buildSectionHeader('Kelompok Pecinta Blonde'),
            const SizedBox(height: 15),

            // Team Members List
            _buildMemberCard(
              name: 'Leon Yaputra',
              nim: '241130251',
              role: 'Ketua Kelompok',
            ),
            _buildMemberCard(
              name: 'Stanley Sun',
              nim: '241130212',
              role: 'Anggota',
            ),
            _buildMemberCard(
              name: 'Leonardo Muliangga',
              nim: '241130726',
              role: 'Anggota',
            ),
            _buildMemberCard(name: 'Edbert', nim: '241130865', role: 'Anggota'),
            _buildMemberCard(
              name: 'Charles',
              nim: '241130269',
              role: 'Anggota',
            ),

            const SizedBox(height: 30),
            Text(
              '© 2024 SpeakUp Team',
              style: TextStyle(
                color: AppColors.black.withValues(alpha: 0.5),
                fontSize: AppFonts.fontSmall,
              ),
            ),
            const SizedBox(height: 20),
          ],
        ),
      ),
    );
  }

  Widget _buildSectionHeader(String title) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 15),
      decoration: BoxDecoration(
        color: AppColors.primary,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Text(
        title,
        textAlign: TextAlign.center,
        style: const TextStyle(
          color: AppColors.white,
          fontSize: AppFonts.fontMedium,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }

  Widget _buildMemberCard({
    required String name,
    required String nim,
    required String role,
  }) {
    return Container(
      margin: const EdgeInsets.only(bottom: 12),
      padding: const EdgeInsets.all(15),
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
        border: Border.all(
          color: AppColors.grey,
          width: 1,
        ),
      ),
      child: Row(
        children: [
          CircleAvatar(
            backgroundColor: AppColors.grey,
            child: Text(
              name[0],
              style: const TextStyle(
                color: AppColors.black,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          const SizedBox(width: 15),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  name,
                  style: const TextStyle(
                    fontSize: AppFonts.fontMedium,
                    fontWeight: FontWeight.bold,
                    color: AppColors.black,
                  ),
                ),
                Text(
                  'NIM: $nim',
                  style: TextStyle(
                    fontSize: AppFonts.fontSmall,
                    color: AppColors.black.withValues(alpha: 0.6),
                  ),
                ),
              ],
            ),
          ),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
            decoration: BoxDecoration(
              color: AppColors.grey,
              borderRadius: BorderRadius.circular(20),
            ),
            child: Text(
              role,
              style: TextStyle(
                fontSize: 10,
                fontWeight: FontWeight.bold,
                color: AppColors.black.withValues(alpha: 0.6),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
