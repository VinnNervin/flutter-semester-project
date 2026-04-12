import 'package:first_app/features/home/models/lesson_menu_model.dart';
import 'package:first_app/features/home/widgets/lesson_grid_item.dart';
import 'package:first_app/theme/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:lucide_icons_flutter/lucide_icons.dart';

class LessonMenu extends StatelessWidget {
  const LessonMenu({super.key});

  static const List<LessonMenuModel> _lessonMenus = [
    LessonMenuModel(
      label: "PETUALANGAN",
      icon: LucideIcons.mapPinned,
      backgroundColor: AppColors.primary,
      iconColor: AppColors.primaryAccent,
      isFullWidth: true,
      angle: 10,
      right: -20,
      bottom: -40,
    ),

    LessonMenuModel(
      label: "KOSAKATA",
      icon: LucideIcons.bookMarked,
      backgroundColor: AppColors.blue,
      iconColor: AppColors.blueAccent,
      right: -20,
      bottom: -40,
    ),
    LessonMenuModel(
      label: "KUIS",
      icon: LucideIcons.fileQuestionMark,
      backgroundColor: AppColors.orange,
      iconColor: AppColors.orangeAccent,
    ),
    LessonMenuModel(
      label: "MENDENGARKAN",
      icon: LucideIcons.headphones,
      backgroundColor: AppColors.secondary,
      bottom: -10,
      iconColor: AppColors.secondaryAccent,
      angle: 20,
    ),
    LessonMenuModel(
      label: "BERBICARA",
      icon: Icons.mic_none_outlined,
      right: -30,
      backgroundColor: AppColors.red,
      iconColor: AppColors.redAccent,
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'PELAJARAN',
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 20,
              color: AppColors.primaryAccent,
            ),
          ),
          const SizedBox(height: 15),
          LayoutBuilder(
            builder: (context, constraints) {
              const spacing = 16.0;
              final itemWidth = (constraints.maxWidth - spacing) / 2;

              return Wrap(
                runSpacing: spacing,
                spacing: spacing,
                children: _lessonMenus.map((menu) {
                  final double currentWidth = menu.isFullWidth
                      ? constraints.maxWidth
                      : itemWidth;

                  return SizedBox(
                    width: currentWidth,
                    height: menu.isFullWidth ? 110 : 130,
                    child: Material(
                      color: menu.backgroundColor,
                      clipBehavior: Clip.hardEdge,
                      borderRadius: BorderRadius.circular(20),
                      child: InkWell(
                        borderRadius: BorderRadius.circular(20),
                        onTap: () {
                          print('click');
                        },
                        child: LessonGridItem(
                          label: menu.label,
                          icon: menu.icon,
                          angle: menu.angle,
                          iconColor: menu.iconColor,
                          bottom: menu.bottom,
                          right: menu.right,
                          isFullWidth: menu.isFullWidth,
                        ),
                      ),
                    ),
                  );
                }).toList(),
              );
            },
          ),
        ],
      ),
    );
  }
}
