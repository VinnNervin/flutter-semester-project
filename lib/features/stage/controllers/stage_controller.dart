import 'package:first_app/features/stage/models/question_model.dart';
import 'package:first_app/features/stage/services/stage_service.dart';

class StageController {
  final StageService _service = StageService();
  
  List<QuestionModel> questions = [];
  int currentIndex = 0;
  int correctAnswers = 0;
  bool isLoading = true;
  int? selectedOption;
  bool isAnswered = false;

  Future<void> init(String path) async {
    isLoading = true;
    questions = await _service.getQuestions(path);
    isLoading = false;
  }

  QuestionModel? get currentQuestion => 
      questions.isNotEmpty && currentIndex < questions.length ? questions[currentIndex] : null;

  double get progress => questions.isEmpty ? 0 : (currentIndex + (isAnswered ? 1 : 0)) / questions.length;

  bool checkAnswer(int index) {
    if (isAnswered) return false;

    selectedOption = index;
    isAnswered = true;
    
    bool isCorrect = index == currentQuestion?.correctIndex;
    if (isCorrect) {
      correctAnswers++;
    }
    return isCorrect;
  }

  bool nextQuestion() {
    if (currentIndex < questions.length - 1) {
      currentIndex++;
      selectedOption = null;
      isAnswered = false;
      return true; // Still have questions
    }
    return false; // Finished
  }

  void reset() {
    currentIndex = 0;
    correctAnswers = 0;
    selectedOption = null;
    isAnswered = false;
  }
}
