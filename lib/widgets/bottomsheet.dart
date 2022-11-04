import 'package:flutter/material.dart';
import 'package:quran_app/models/quranModel.dart';
import 'package:quran_app/view_models/quran_view_model.dart';
import 'package:quran/quran.dart' as quran;

Future bottomsheet(BuildContext context, int surahNumber) =>
    showModalBottomSheet(
      isScrollControlled: true,
      context: context,
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(top: Radius.circular(30))),
      builder: (context) {
        return Container(
          height: MediaQuery.of(context).size.height * 0.8,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.only(
                topRight: Radius.circular(30), topLeft: Radius.circular(30)),
            color: Colors.orange[100],
          ),
          padding: EdgeInsets.only(top: 20, right: 20, left: 20),
          child: FutureBuilder<QuranModel?>(
            future: QuranViewModel.getAyahOfThisSurah(surahNumber),
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                return ListView.builder(
                  itemCount: quran.getVerseCount(surahNumber),
                  itemBuilder: (context, i) {
                    return Column(
                      mainAxisSize: MainAxisSize.min,
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        Center(
                          child: Text(
                            quran.getVerseEndSymbol(i + 1),
                            style: TextStyle(
                                fontSize: 25, backgroundColor: Colors.white54),
                          ),
                        ),
                        Text(
                          quran.getVerse(surahNumber, i + 1),
                          textDirection: TextDirection.rtl,
                          style: TextStyle(
                              fontFamily: 'AmiriQuran',
                              fontSize: 25,
                              backgroundColor: Colors.white54),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Text(
                          snapshot.data!.ayahs![i].text.toString(),
                          style: TextStyle(
                              fontSize: 25, backgroundColor: Colors.white54),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Divider(
                          color: Colors.black,
                          height: 2,
                          thickness: 2,
                        )
                      ],
                    );
                  },
                );
              }
              return const Text("");
            },
          ),
        );
      },
    );
