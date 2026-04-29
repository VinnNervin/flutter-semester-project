import 'package:first_app/features/adventure/models/chapter_model.dart';
import 'package:first_app/features/adventure/services/adventure_service.dart';

class AdventureController {
  final AdventureService _service = AdventureService();

  List<ChapterModel> chapters = [];
  bool isLoading = true;

  Future<void> init() async {
    isLoading = true;
    chapters = await _service.getChapters();
    isLoading = false;
  }
}
