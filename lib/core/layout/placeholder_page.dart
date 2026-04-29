import 'package:flutter/material.dart';
import 'package:first_app/theme/app_colors.dart';
import 'package:first_app/theme/app_fonts.dart';

class PlaceholderPage extends StatefulWidget {
  const PlaceholderPage({super.key});

  @override
  State<PlaceholderPage> createState() => PlaceholderPageState();
}

class PlaceholderPageState extends State<PlaceholderPage>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(seconds: 2),
      vsync: this,
    )..repeat(reverse: true);
    _animation = Tween<double>(
      begin: -10,
      end: 10,
    ).animate(CurvedAnimation(parent: _controller, curve: Curves.easeInOut));
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      body: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 30),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              AnimatedBuilder(
                animation: _animation,
                builder: (context, child) {
                  return Transform.translate(
                    offset: Offset(0, _animation.value),
                    child: Container(
                      padding: const EdgeInsets.all(30),
                      decoration: BoxDecoration(
                        border: Border.all(color: AppColors.primary, width: 2),
                        color: AppColors.white,
                        shape: BoxShape.circle,
                      ),
                      child: const Icon(
                        Icons.construction_rounded,
                        size: 80,
                        color: AppColors.primary,
                      ),
                    ),
                  );
                },
              ),
              const SizedBox(height: 40),

              // Text Content
              const Text(
                'Tunggu UAS',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: AppFonts.fontLarge,
                  fontWeight: FontWeight.bold,
                  color: AppColors.primary,
                ),
              ),
              const SizedBox(height: 15),
              Text(
                'Area ini sedang dalam tahap pengembangan intensif oleh tim Kelompok Pecinta Blonde.',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: AppFonts.fontMedium,
                  color: AppColors.black.withValues(alpha: 0.7),
                  height: 1.5,
                ),
              ),
              const SizedBox(height: 30),
            ],
          ),
        ),
      ),
    );
  }
}
