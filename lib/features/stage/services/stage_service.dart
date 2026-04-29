import 'dart:convert';
import 'package:flutter/services.dart';
import 'package:first_app/features/stage/models/question_model.dart';

class StageService {
  Future<List<QuestionModel>> getQuestions(String path) async {
    try {
      final String response = await rootBundle.loadString(path);
      final Map<String, dynamic> data = json.decode(response);
      final List<dynamic> questionsJson = data['question'];
      return questionsJson.map((json) => QuestionModel.fromJson(json)).toList();
    } catch (e) {
      throw Exception("Gagal memuat data soal: $e");
    }
  }
}
