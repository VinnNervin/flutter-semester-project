import 'package:first_app/core/widgets/HomepageNavgation/homepage_navigation.dart';
import 'package:first_app/features/adventure/pages/adventure_layout.dart';
import 'package:first_app/features/home/pages/home_page.dart';
import 'package:first_app/core/widgets/HomepageHeader/home_header.dart';
import 'package:first_app/theme/app_colors.dart';
import 'package:flutter/material.dart';

class MainLayout extends StatefulWidget {
  const MainLayout({super.key});

  @override
  State<MainLayout> createState() => _MainLayoutState();
}

class _MainLayoutState extends State<MainLayout> {
  int currentIndex = 0;

  final List<Widget> pages = [HomePage(), AdventureLayout()];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: HomeHeader(),
      body: Container(
        decoration: BoxDecoration(color: AppColors.primaryLight),
        child: IndexedStack(index: currentIndex, children: pages),
      ),

      bottomNavigationBar: HomepageNavigation(
        currentIndex: currentIndex,
        onTap: (index) {
          setState(() {
            currentIndex = index;
          });
        },
      ),
    );
  }
}
