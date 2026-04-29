class QuestionModel {
  final String id;
  final String type;
  final String question;
  final List<String> options;
  final int correctIndex;
  final String explanation;

  QuestionModel({
    required this.id,
    required this.type,
    required this.question,
    required this.options,
    required this.correctIndex,
    required this.explanation,
  });

  factory QuestionModel.fromJson(Map<String, dynamic> json) {
    return QuestionModel(
      id: json['id'],
      type: json['type'],
      question: json['question'],
      options: List<String>.from(json['options']),
      correctIndex: json['correctIndex'],
      explanation: json['explanation'],
    );
  }
}
