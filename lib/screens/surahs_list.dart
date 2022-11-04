import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:quran/quran.dart' as quran;
import 'package:quran_app/screens/surah_scren.dart';

class SurahsList extends StatefulWidget {
  SurahsList({
    Key? key,
  }) : super(key: key);

  @override
  State<SurahsList> createState() => _SurahsListState();
}

class _SurahsListState extends State<SurahsList> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
            title: Text("chaptersOfQuran".tr()),
            centerTitle: true,
            elevation: 10,
            backgroundColor: Colors.black),
        backgroundColor: Colors.deepOrange[50],
        body: ListView.builder(
          itemCount: quran.getTotalSurahCount(),
          itemBuilder: (context, i) {
            return InkWell(
              onTap: () => Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => SurahScreen(surahNumber: i + 1),
                  )),
              child: Column(
                children: [
                  ListTile(
                    leading: Container(
                        alignment: Alignment.center,
                        width: 40,
                        height: 60,
                        color: Colors.black,
                        child: Text(
                          "${i + 1}",
                          style: TextStyle(color: Colors.white),
                        )),
                    title: Text(
                      quran.getSurahNameArabic(i + 1),
                      style: TextStyle(fontSize: 22, fontFamily: 'kitab'),
                    ),
                    subtitle: Text(quran.getSurahNameEnglish(i + 1)),
                    trailing: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                              "verses".tr() +
                                  " / " +
                                  quran.getVerseCount(i + 1).toString(),
                              style: TextStyle(fontSize: 16)),
                          quran.getPlaceOfRevelation(i + 1) == "Madinah"
                              ? Image.asset(
                                  "assets/icons/nabawi-mosque.png",
                                  color: Colors.green,
                                  width: 30,
                                  height: 25,
                                )
                              : Image.asset(
                                  "assets/icons/kaaba.png",
                                  width: 30,
                                  height: 25,
                                )
                        ]),
                  ),
                  Divider(
                    color: Colors.black,
                    thickness: 1,
                  )
                ],
              ),
            );
          },
        ));
  }
}
