import 'dart:convert';
import 'package:first_app/core/widgets/DynamicButton/Dynamic_Button.dart';
import 'package:first_app/core/widgets/DynamicButton/dynamic_button_model.dart';
import 'package:first_app/theme/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class AdventureLayout extends StatelessWidget {
  const AdventureLayout({super.key});

  // Fungsi untuk membaca file JSON
  Future<Map<String, dynamic>> loadChapterData() async {
    // 1. Ambil String dari Assets
    final String response = await rootBundle.loadString(
      'assets/data/chapter_1.json',
    );
    // 2. Ubah String jadi Map (Object Dart)
    final data = await json.decode(response);
    return data;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: FutureBuilder<Map<String, dynamic>>(
        future: loadChapterData(),
        builder: (context, snapshot) {
          // A. Jika data masih loading
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          }

          // B. Jika terjadi error
          if (snapshot.hasError) {
            return Center(child: Text("Error: ${snapshot.error}"));
          }

          // C. Jika data sudah siap
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
                    // 1. HEADER (Tampilan Penuh / Full Width)
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

                            // circle box with book icon
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

                    // 2. GRID (Pelajaran Tampil 2 Kolom)
                    SliverPadding(
                      padding: const EdgeInsets.symmetric(horizontal: 16.0),
                      sliver: SliverGrid(
                        gridDelegate:
                            const SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount:
                                  2, // <--- Ini yang membuat 2 Kolom
                              mainAxisSpacing: 16,
                              crossAxisSpacing: 16,
                              childAspectRatio:
                                  1.1, // Atur tinggi kotak di sini
                            ),
                        delegate: SliverChildBuilderDelegate(
                          (context, index) {
                            final lesson = lessons[index];
                            return DynamicButton(
                              model: DynamicButtonModel(
                                fontColor: AppColors.white,
                                shadowColor: Colors.black.withAlpha(50),
                                label: lesson['lesson_title'],
                                backgroundColor: Colors.blue,
                              ),
                            );
                          },
                          childCount:
                              lessons.length, // Jumlah pelajaran dari JSON
                        ),
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
