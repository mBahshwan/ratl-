import 'package:flutter/material.dart';
import 'package:quran/quran.dart' as quran;
import 'package:quran/surahData.dart';

import 'package:quran_app/models/quranModel.dart';
import 'package:quran_app/view_models/quran_view_model.dart';
import 'package:quran_app/widgets/bottomsheet.dart';

class SurahScreen extends StatelessWidget {
  final int surahNumber;
  SurahScreen({
    Key? key,
    required this.surahNumber,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Directionality(
      textDirection: TextDirection.rtl,
      child: SafeArea(
        child: Scaffold(
            backgroundColor: Colors.orange[100],
            body: surahNumber == 1 || surahNumber == 9 || surahNumber == 97
                ? ListView(
                    children: [
                      Stack(alignment: Alignment.center, children: [
                        Image.asset("assets/images/surah'sNameFrame.jpg"),
                        Text(
                          quran.getSurahNameArabic(surahNumber),
                          style: TextStyle(fontSize: 50, fontFamily: 'Uthmani'),
                        ),
                      ]),
                      Container(
                        padding: const EdgeInsets.all(8.0),
                        child: InkWell(
                          onTap: () {
                            bottomsheet(context, surahNumber);
                          },
                          child: RichText(
                            textAlign: TextAlign.justify,
                            text: TextSpan(
                              children: [
                                for (int i = 0;
                                    i < quran.getVerseCount(surahNumber);
                                    i++) ...{
                                  TextSpan(
                                    text: ' ' +
                                        quran.getVerse(surahNumber, i + 1,
                                            verseEndSymbol: true),
                                    style: const TextStyle(
                                      fontFamily: 'AmiriQuran',
                                      fontSize: 30,
                                      color: Colors.black87,
                                    ),
                                  ),
                                }
                              ],
                            ),
                          ),
                        ),
                      ),
                    ],
                  )
                : ListView(
                    children: [
                      Stack(alignment: Alignment.center, children: [
                        Image.asset("assets/images/surah'sNameFrame.jpg"),
                        Text(
                          quran.getSurahNameArabic(surahNumber),
                          style: TextStyle(fontSize: 50, fontFamily: 'Uthmani'),
                        ),
                      ]),
                      Container(
                        padding: EdgeInsets.only(top: 50),
                        height: size.height * 0.2,
                        width: double.infinity,
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.vertical(
                                bottom: Radius.circular(30))),
                        child: Text(
                          textAlign: TextAlign.center,
                          quran.getBasmala(),
                          style: TextStyle(
                              fontSize: 35,
                              fontFamily: 'uthmani',
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                      Container(
                        padding: const EdgeInsets.all(8.0),
                        child: InkWell(
                          onTap: () {
                            bottomsheet(context, surahNumber);
                          },
                          child: RichText(
                            textAlign: TextAlign.justify,
                            text: TextSpan(
                              children: [
                                for (int i = 0;
                                    i < quran.getVerseCount(surahNumber);
                                    i++) ...{
                                  TextSpan(
                                    text: ' ' +
                                        quran.getVerse(surahNumber, i + 1,
                                            verseEndSymbol: true),
                                    style: const TextStyle(
                                      fontFamily: 'AmiriQuran',
                                      fontSize: 30,
                                      color: Colors.black87,
                                    ),
                                  ),
                                }
                              ],
                            ),
                          ),
                        ),
                      ),
                    ],
                  )),
      ),
    );
  }
}
