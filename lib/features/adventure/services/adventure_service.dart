import 'dart:convert';
import 'package:flutter/services.dart';
import 'package:first_app/features/adventure/models/chapter_model.dart';

class AdventureService {
  Future<List<ChapterModel>> getChapters() async {
    try {
      final String response = await rootBundle.loadString('assets/data/chapters.json');
      final List<dynamic> data = json.decode(response);
      return data.map((json) => ChapterModel.fromJson(json)).toList();
    } catch (e) {
      throw Exception("Gagal memuat data chapter: $e");
    }
  }
}
