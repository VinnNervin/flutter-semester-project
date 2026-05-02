import 'package:first_app/core/widgets/DynamicButton/Dynamic_Button.dart';
import 'package:first_app/core/widgets/DynamicButton/dynamic_button_config.dart';
import 'package:first_app/features/adventure/controllers/adventure_controller.dart';
import 'package:first_app/features/adventure/models/chapter_model.dart';
import 'package:first_app/features/stage/pages/stage_page.dart';
import 'package:first_app/theme/app_colors.dart';
import 'package:flutter/material.dart';

class AdventureLayout extends StatefulWidget {
  const AdventureLayout({super.key});

  @override
  State<AdventureLayout> createState() => _AdventureLayoutState();
}

class _AdventureLayoutState extends State<AdventureLayout> {
  final AdventureController _controller = AdventureController();

  @override
  void initState() {
    super.initState();
    _initData();
  }

  Future<void> _initData() async {
    await _controller.init();
    if (mounted) setState(() {});
  }

  void _navigateToStage(String filePath) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => StagePage(filePath: filePath)),
    );
  }

  @override
  Widget build(BuildContext context) {
    if (_controller.isLoading) {
      return const Center(child: CircularProgressIndicator());
    }

    return Container(
      decoration: const BoxDecoration(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(25),
          bottomRight: Radius.circular(25),
        ),
        color: AppColors.white,
      ),
      child: CustomScrollView(
        slivers: [
          ..._controller.chapters.map(
            (chapter) => _buildChapterSection(chapter),
          ),
          const SliverToBoxAdapter(child: SizedBox(height: 30)),
        ],
      ),
    );
  }

  Widget _buildChapterHeader(ChapterModel chapter) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            width: 80,
            height: 80,
            decoration: const BoxDecoration(
              shape: BoxShape.circle,
              color: AppColors.orange,
            ),
            child: const Icon(Icons.book, color: AppColors.white, size: 40),
          ),
          const SizedBox(height: 12),
          Text(
            chapter.chapterTitle,
            textAlign: TextAlign.center,
            style: const TextStyle(
              fontSize: 22,
              fontWeight: FontWeight.bold,
              color: AppColors.black,
            ),
          ),
          const SizedBox(height: 4),
          Text(
            chapter.chapterDesc,
            textAlign: TextAlign.center,
            style: const TextStyle(color: Colors.grey),
          ),
          const SizedBox(height: 10),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
            decoration: BoxDecoration(
              color: AppColors.primary.withValues(alpha: 0.1),
              borderRadius: BorderRadius.circular(20),
            ),
            child: Text(
              "${chapter.stages.length} Stage",
              style: const TextStyle(
                color: AppColors.primary,
                fontWeight: FontWeight.bold,
                fontSize: 12,
              ),
            ),
          ),
          const SizedBox(height: 20),
        ],
      ),
    );
  }

  Widget _buildStageButton(StageItemModel stage) {
    return DynamicButton(
      config: DynamicButtonConfig(
        label: stage.stageName,
        backgroundColor: AppColors.primary,
        shadowColor: AppColors.black.withValues(alpha: 0.5),
        fontColor: AppColors.white,
        onPressed: () => _navigateToStage(stage.file),
      ),
    );
  }

  SliverMainAxisGroup _buildChapterSection(ChapterModel chapter) {
    return SliverMainAxisGroup(
      slivers: [
        SliverToBoxAdapter(child: _buildChapterHeader(chapter)),
        SliverPadding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          sliver: SliverGrid(
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              mainAxisSpacing: 16,
              crossAxisSpacing: 16,
              childAspectRatio: 1.1,
            ),
            delegate: SliverChildBuilderDelegate(
              (context, index) => _buildStageButton(chapter.stages[index]),
              childCount: chapter.stages.length,
            ),
          ),
        ),
        // const SliverToBoxAdapter(
        //   // child: Divider(height: 40, indent: 20, endIndent: 20),
        // ),
      ],
    );
  }
}
