import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:quran_app/screens/surah_scren.dart';
import 'package:quran_app/widgets/trasnlatedWidget.dart';

class MainScreenFunctions {
  static InkWell goToSurah(BuildContext context) {
    DateTime date = DateTime.now();
    String readSurah = "";
    int surahIklasNumber = 112;
    int surahKahfNumber = 18;
    if (date.weekday == 5) {
      readSurah = "RSK".tr();
    } else {
      readSurah = "RSI".tr();
    }
    return InkWell(
        child: Text(
          "$readSurah",
          style: TextStyle(
              color: Colors.brown, fontWeight: FontWeight.bold, fontSize: 15),
        ),
        onTap: () => Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => SurahScreen(
                  surahNumber:
                      date.weekday == 5 ? surahKahfNumber : surahIklasNumber),
            )));
  }

  static languageDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) => Dialog(
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(25)),
          backgroundColor: Colors.orange[100],
          child: ChooseLanguage()),
    );
  }
}
