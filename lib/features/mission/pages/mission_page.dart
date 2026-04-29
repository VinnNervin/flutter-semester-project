import 'package:flutter/material.dart';
import 'package:first_app/theme/app_colors.dart';
import 'package:first_app/theme/app_fonts.dart';
import 'package:first_app/theme/app_sizing.dart';

class MissionPage extends StatelessWidget {
  const MissionPage({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        backgroundColor: AppColors.white,
        appBar: AppBar(
          backgroundColor: AppColors.white,
          elevation: 0,
          title: const Text(
            'Misi Saya',
            style: TextStyle(
              color: AppColors.black,
              fontWeight: FontWeight.bold,
              fontSize: AppFonts.fontLarge,
            ),
          ),
          centerTitle: true,
          bottom: TabBar(
            indicatorColor: AppColors.primary,
            indicatorWeight: 3,
            labelColor: AppColors.primary,
            unselectedLabelColor: AppColors.grey,
            labelStyle: const TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: AppFonts.fontMedium,
            ),
            tabs: const [
              Tab(text: 'Harian'),
              Tab(text: 'Mingguan'),
            ],
          ),
        ),
        body: const TabBarView(children: [_DailyMissions(), _WeeklyMissions()]),
      ),
    );
  }
}

class _DailyMissions extends StatelessWidget {
  const _DailyMissions();

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: EdgeInsets.all(AppSizing.paddingMD),
      children: [
        _buildHeaderCard(),
        const SizedBox(height: 20),
        const Text(
          'Daftar Misi',
          style: TextStyle(
            fontSize: AppFonts.fontMedium,
            fontWeight: FontWeight.bold,
            color: AppColors.black,
          ),
        ),
        const SizedBox(height: 10),
        _MissionCard(
          title: 'Selesaikan 2 Pelajaran',
          description: 'Belajar apa saja hari ini untuk mendapatkan EXP.',
          icon: Icons.book,
          iconColor: AppColors.primary,
          progress: 0.5,
          progressText: '1/2',
          reward: 50,
        ),
        _MissionCard(
          title: 'Latihan Berbicara',
          description: 'Selesaikan 1 sesi latihan pengucapan.',
          icon: Icons.mic,
          iconColor: AppColors.red,
          progress: 0.0,
          progressText: '0/1',
          reward: 30,
        ),
        _MissionCard(
          title: 'Dapatkan Nilai Sempurna',
          description: 'Jawab semua pertanyaan benar di satu kuis.',
          icon: Icons.star,
          iconColor: AppColors.orange,
          progress: 1.0,
          progressText: '1/1',
          reward: 100,
          isCompleted: true,
        ),
      ],
    );
  }

  Widget _buildHeaderCard() {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: AppColors.primary,
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
          BoxShadow(
            color: AppColors.primary.withValues(alpha: 0.3),
            blurRadius: 15,
            offset: const Offset(0, 5),
          ),
        ],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'Peti Hadiah Harian',
                style: TextStyle(
                  color: AppColors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: AppFonts.fontMedium,
                ),
              ),
              const SizedBox(height: 5),
              Text(
                'Selesaikan 3 misi\nuntuk membuka peti!',
                style: TextStyle(
                  color: AppColors.white.withValues(alpha: 0.8),
                  fontSize: AppFonts.fontSmall,
                ),
              ),
            ],
          ),
          const Icon(Icons.card_giftcard, size: 60, color: AppColors.white),
        ],
      ),
    );
  }
}

class _WeeklyMissions extends StatelessWidget {
  const _WeeklyMissions();

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: EdgeInsets.all(AppSizing.paddingMD),
      children: [
        _MissionCard(
          title: 'Pejuang Akhir Pekan',
          description: 'Selesaikan 10 pelajaran dalam seminggu.',
          icon: Icons.local_fire_department,
          iconColor: AppColors.orange,
          progress: 0.3,
          progressText: '3/10',
          reward: 500,
        ),
        _MissionCard(
          title: 'Master Kosakata',
          description: 'Pelajari 50 kata baru minggu ini.',
          icon: Icons.text_fields,
          iconColor: AppColors.secondary,
          progress: 0.8,
          progressText: '40/50',
          reward: 300,
        ),
      ],
    );
  }
}

class _MissionCard extends StatelessWidget {
  final String title;
  final String description;
  final IconData icon;
  final Color iconColor;
  final double progress;
  final String progressText;
  final int reward;
  final bool isCompleted;

  const _MissionCard({
    required this.title,
    required this.description,
    required this.icon,
    required this.iconColor,
    required this.progress,
    required this.progressText,
    required this.reward,
    this.isCompleted = false,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 15),
      padding: const EdgeInsets.all(15),
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.05),
            blurRadius: 10,
            offset: const Offset(0, 4),
          ),
        ],
        border: Border.all(
          color: isCompleted ? AppColors.secondary : Colors.transparent,
          width: 2,
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Container(
                padding: const EdgeInsets.all(12),
                decoration: BoxDecoration(
                  color: iconColor.withValues(alpha: 0.1),
                  shape: BoxShape.circle,
                ),
                child: Icon(icon, color: iconColor, size: 28),
              ),
              const SizedBox(width: 15),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      title,
                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: AppFonts.fontMedium,
                        color: AppColors.black,
                      ),
                    ),
                    const SizedBox(height: 4),
                    Text(
                      description,
                      style: TextStyle(
                        fontSize: AppFonts.fontSmall,
                        color: AppColors.black.withValues(alpha: 0.6),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
          const SizedBox(height: 15),
          Row(
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          progressText,
                          style: const TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: AppFonts.fontSmall,
                          ),
                        ),
                        Row(
                          children: [
                            const Icon(
                              Icons.monetization_on,
                              size: 16,
                              color: AppColors.orange,
                            ),
                            const SizedBox(width: 4),
                            Text(
                              '+$reward EXP',
                              style: const TextStyle(
                                fontWeight: FontWeight.bold,
                                color: AppColors.orange,
                                fontSize: AppFonts.fontSmall,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                    const SizedBox(height: 8),
                    ClipRRect(
                      borderRadius: BorderRadius.circular(10),
                      child: LinearProgressIndicator(
                        value: progress,
                        minHeight: 8,
                        backgroundColor: AppColors.grey,
                        valueColor: AlwaysStoppedAnimation<Color>(
                          isCompleted ? AppColors.secondary : AppColors.primary,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(width: 15),
              ElevatedButton(
                onPressed: () {},
                style: ElevatedButton.styleFrom(
                  backgroundColor: isCompleted
                      ? AppColors.secondary
                      : AppColors.primary.withValues(alpha: 0.1),
                  foregroundColor: isCompleted
                      ? AppColors.white
                      : AppColors.primary,
                  elevation: 0,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                  padding: const EdgeInsets.symmetric(
                    horizontal: 16,
                    vertical: 12,
                  ),
                ),
                child: Text(
                  isCompleted ? 'Klaim' : 'Mulai',
                  style: const TextStyle(fontWeight: FontWeight.bold),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
