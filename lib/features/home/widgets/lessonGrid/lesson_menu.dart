import 'package:first_app/features/home/widgets/lessonGrid/lesson_menu_config.dart';
import 'package:first_app/features/home/widgets/introText/intro_text.dart';
import 'package:first_app/features/home/widgets/lessonGridItem/lesson_grid_item.dart';
import 'package:first_app/theme/app_colors.dart';
import 'package:first_app/theme/app_fonts.dart';
import 'package:first_app/theme/app_sizing.dart';
import 'package:flutter/material.dart';
import 'package:lucide_icons_flutter/lucide_icons.dart';

class LessonMenu extends StatelessWidget {
  const LessonMenu({super.key});

  static const List<LessonMenuConfig> _lessonMenus = [
    LessonMenuConfig(
      label: "PETUALANGAN",
      fontSize: AppFonts.fontLarge,
      icon: LucideIcons.mapPinned,
      backgroundColor: AppColors.primary,
      iconColor: AppColors.primaryLight,
      isFullWidth: true,
      angle: 10,
      right: -20,
      bottom: -40,
    ),

    LessonMenuConfig(
      label: "KOSAKATA",
      icon: LucideIcons.bookMarked,
      backgroundColor: AppColors.purple,
      iconColor: AppColors.purpleLight,
      right: -20,
      bottom: -40,
    ),
    LessonMenuConfig(
      label: "KUIS",
      icon: LucideIcons.fileQuestionMark,
      backgroundColor: AppColors.orange,
      iconColor: AppColors.orangeAccent,
    ),
    LessonMenuConfig(
      label: "MENDENGAR",
      icon: LucideIcons.headphones,
      backgroundColor: AppColors.secondary,
      bottom: -10,
      iconColor: AppColors.secondaryAccent,
      angle: 20,
    ),
    LessonMenuConfig(
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
      padding: EdgeInsets.symmetric(horizontal: AppSizing.paddingMD),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          IntroText(),
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
                          fontSize: menu.fontSize,
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
