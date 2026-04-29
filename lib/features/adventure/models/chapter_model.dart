class StageItemModel {
  final String stageId;
  final String stageName;
  final String file;
  final int totalQuestions;

  StageItemModel({
    required this.stageId,
    required this.stageName,
    required this.file,
    required this.totalQuestions,
  });

  factory StageItemModel.fromJson(Map<String, dynamic> json) {
    return StageItemModel(
      stageId: json['stage_id'],
      stageName: json['stage_name'],
      file: json['file'],
      totalQuestions: json['total_questions'],
    );
  }
}

class ChapterModel {
  final String chapterId;
  final String chapterTitle;
  final String chapterDesc;
  final String icon;
  final List<StageItemModel> stages;

  ChapterModel({
    required this.chapterId,
    required this.chapterTitle,
    required this.chapterDesc,
    required this.icon,
    required this.stages,
  });

  factory ChapterModel.fromJson(Map<String, dynamic> json) {
    return ChapterModel(
      chapterId: json['chapter_id'],
      chapterTitle: json['chapter_title'],
      chapterDesc: json['chapter_desc'],
      icon: json['icon'],
      stages: (json['stages'] as List)
          .map((s) => StageItemModel.fromJson(s))
          .toList(),
    );
  }
}
