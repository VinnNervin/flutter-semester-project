import 'dart:convert';
import 'package:first_app/core/widgets/DynamicButton/Dynamic_Button.dart';
import 'package:first_app/core/widgets/DynamicButton/dynamic_button_config.dart';
import 'package:first_app/theme/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class AdventureLayout extends StatelessWidget {
  const AdventureLayout({super.key});

  Future<Map<String, dynamic>> loadChapterData() async {
    final String response = await rootBundle.loadString(
      'assets/data/chapter_1.json',
    );

    final data = await json.decode(response);
    return data;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: FutureBuilder<Map<String, dynamic>>(
        future: loadChapterData(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          }

          if (snapshot.hasError) {
            return Center(child: Text("Error: ${snapshot.error}"));
          }

          if (snapshot.hasData) {
            final chapter = snapshot.data!;
            final lessons = chapter['lessons'] as List;

            return Container(
              color: AppColors.primaryLight,
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(25),
                    bottomRight: Radius.circular(25),
                  ),
                  color: AppColors.white,
                ),
                child: CustomScrollView(
                  slivers: [
                    SliverToBoxAdapter(
                      child: Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Text(
                              chapter['chapter_title'],
                              style: TextStyle(
                                fontSize: 24,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            Text(
                              chapter['chapter_desc'],
                              style: TextStyle(color: Colors.grey),
                            ),
                            SizedBox(height: 20),

                            Container(
                              width: 80,
                              height: 80,
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                color: AppColors.orange,
                              ),
                              child: Icon(Icons.book, color: AppColors.white),
                            ),
                          ],
                        ),
                      ),
                    ),

                    SliverPadding(
                      padding: const EdgeInsets.symmetric(horizontal: 16.0),
                      sliver: SliverGrid(
                        gridDelegate:
                            const SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount: 2,
                              mainAxisSpacing: 16,
                              crossAxisSpacing: 16,
                              childAspectRatio: 1.1,
                            ),
                        delegate: SliverChildBuilderDelegate((context, index) {
                          final lesson = lessons[index];
                          return DynamicButton(
                            config: DynamicButtonConfig(
                              fontColor: AppColors.white,
                              shadowColor: Colors.black.withAlpha(50),
                              label: lesson['lesson_title'],
                              backgroundColor: const Color.fromRGBO(
                                33,
                                150,
                                243,
                                1,
                              ),
                            ),
                          );
                        }, childCount: lessons.length),
                      ),
                    ),

                    SliverToBoxAdapter(child: SizedBox(height: 20)),
                  ],
                ),
              ),
            );
          }

          return const Center(child: Text("Data Kosong"));
        },
      ),
    );
  }
}
