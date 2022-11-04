import 'dart:convert';
import 'package:flutter/services.dart';
import 'package:quran_app/models/quranModel.dart';

class QuranViewModel {
  Future<List<QuranModel>> getSurahName() async {
    String _loadFile =
        await rootBundle.loadString("assets/jsonFile/completed_quran.json");
    List loadedData = json.decode(_loadFile);
    List<QuranModel> list =
        loadedData.map((e) => QuranModel.fromJson(e)).toList();

    return list;
  }

  static Future<QuranModel?> getAyahOfThisSurah(int surahNumber) async {
    String _loadFile =
        await rootBundle.loadString("assets/jsonFile/completed_quran.json");
    List loadedData = json.decode(_loadFile);
    List<QuranModel> quranList =
        loadedData.map((e) => QuranModel.fromJson(e)).toList();
    for (var element in quranList) {
      if (element.number == surahNumber) {
        return element;
      }
    }
  }
}
