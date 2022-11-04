import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:quran_app/screens/doublicate_screen/doublicate_screen.dart';
import 'package:quran_app/view_models/mainScreenFunctions.dart';
import 'package:quran_app/view_models/surah_of_time.dart';
import 'package:quran_app/screens/adhan_timeTable.dart';
import 'package:quran_app/screens/adhkar_page.dart';
import 'package:quran_app/screens/qiblaScreen.dart';
import 'package:quran_app/screens/surahs_list.dart';
import 'package:quran_app/screens/tasbih_page.dart';
import 'package:quran_app/widgets/trasnlatedWidget.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({
    Key? key,
  }) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  SurahOfTime _surahOfTime = SurahOfTime();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.orange[100],
        body: Stack(
          children: [
            Image.asset(
              "assets/images/background.png",
              fit: BoxFit.fill,
              height: MediaQuery.of(context).size.height,
            ),
            Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Container(
                    margin: EdgeInsets.symmetric(horizontal: 10, vertical: 30),
                    decoration: BoxDecoration(
                        boxShadow: [
                          BoxShadow(
                              spreadRadius: 20,
                              color: Colors.black.withOpacity(0.5),
                              blurRadius: 20,
                              blurStyle: BlurStyle.normal,
                              offset: Offset(0.0, 10))
                        ],
                        color: Colors.orange[200],
                        borderRadius: BorderRadius.all(Radius.circular(25))),
                    height: MediaQuery.of(context).size.height * 0.35,
                    width: MediaQuery.of(context).size.width,
                    child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Text(
                            textAlign: TextAlign.center,
                            _surahOfTime.showtitleOfTime(),
                            style: TextStyle(
                                fontSize: 20, fontWeight: FontWeight.bold),
                          ),
                          Text(
                              style: TextStyle(fontSize: 18),
                              textAlign: TextAlign.center,
                              _surahOfTime.showContentOfTime()),
                          MainScreenFunctions.goToSurah(context),
                        ]),
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.060,
                  ),
                  Container(
                    padding: EdgeInsets.all(5),
                    margin: EdgeInsets.symmetric(horizontal: 10),
                    decoration: BoxDecoration(
                        border: Border.all(color: Colors.black, width: 3),
                        borderRadius: BorderRadius.all(Radius.circular(25))),
                    height: MediaQuery.of(context).size.height * 0.35,
                    width: MediaQuery.of(context).size.width,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            InkWell(
                              onTap: () => Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => SurahsList(),
                                  )),
                              child: Container(
                                  height:
                                      MediaQuery.of(context).size.height * 0.14,
                                  width:
                                      MediaQuery.of(context).size.width * 0.23,
                                  padding: EdgeInsets.all(5),
                                  alignment: Alignment.center,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(15),
                                    color: Colors.orange[200],
                                  ),
                                  child: Column(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceAround,
                                    children: [
                                      Image.asset(
                                        "assets/icons/quran.png",
                                        height:
                                            MediaQuery.of(context).size.height *
                                                0.07,
                                        width:
                                            MediaQuery.of(context).size.width *
                                                0.2,
                                      ),
                                      Text(
                                        "readQuran".tr(),
                                        textAlign: TextAlign.center,
                                        style: TextStyle(fontSize: 17),
                                      )
                                    ],
                                  )),
                            ),
                            InkWell(
                              onTap: () =>
                                  Navigator.of(context).push(MaterialPageRoute(
                                builder: (context) => TasbihPage(),
                              )),
                              child: Container(
                                height:
                                    MediaQuery.of(context).size.height * 0.14,
                                width: MediaQuery.of(context).size.width * 0.23,
                                padding: EdgeInsets.all(5),
                                alignment: Alignment.center,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(15),
                                  color: Colors.orange[200],
                                ),
                                child: Column(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceAround,
                                  children: [
                                    Image.asset(
                                      "assets/icons/tasbih.png",
                                      height:
                                          MediaQuery.of(context).size.height *
                                              0.07,
                                      width: MediaQuery.of(context).size.width *
                                          0.2,
                                    ),
                                    Text(
                                      "eTasbih".tr(),
                                      textAlign: TextAlign.center,
                                      style: TextStyle(fontSize: 13),
                                    )
                                  ],
                                ),
                              ),
                            ),
                            InkWell(
                              onTap: () => Navigator.of(context).push(
                                MaterialPageRoute(
                                  builder: (context) => Compass(),
                                ),
                              ),
                              child: Container(
                                height:
                                    MediaQuery.of(context).size.height * 0.14,
                                width: MediaQuery.of(context).size.width * 0.23,
                                padding: EdgeInsets.all(5),
                                alignment: Alignment.center,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(15),
                                  color: Colors.orange[200],
                                ),
                                child: Column(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceAround,
                                  children: [
                                    Image.asset(
                                      "assets/icons/qibla.png",
                                      height:
                                          MediaQuery.of(context).size.height *
                                              0.07,
                                      width: MediaQuery.of(context).size.width *
                                          0.2,
                                    ),
                                    Text(
                                      "qibla".tr(),
                                      style: TextStyle(fontSize: 19),
                                    )
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            InkWell(
                              onTap: () => Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => adhkarPage(),
                                  )),
                              child: Container(
                                  height:
                                      MediaQuery.of(context).size.height * 0.14,
                                  width:
                                      MediaQuery.of(context).size.width * 0.23,
                                  padding: EdgeInsets.all(5),
                                  alignment: Alignment.center,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(15),
                                    color: Colors.orange[200],
                                  ),
                                  child: Column(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceAround,
                                    children: [
                                      Image.asset(
                                        "assets/icons/dua.png",
                                        height:
                                            MediaQuery.of(context).size.height *
                                                0.07,
                                        width:
                                            MediaQuery.of(context).size.width *
                                                0.2,
                                      ),
                                      Text(
                                        "adhkar".tr(),
                                        style: TextStyle(fontSize: 18),
                                      )
                                    ],
                                  )),
                            ),
                            InkWell(
                              onTap: () =>
                                  Navigator.of(context).push(MaterialPageRoute(
                                builder: (context) => AdhanTimeTable(),
                              )),
                              child: Container(
                                height:
                                    MediaQuery.of(context).size.height * 0.14,
                                width: MediaQuery.of(context).size.width * 0.23,
                                padding: EdgeInsets.all(5),
                                alignment: Alignment.center,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(15),
                                  color: Colors.orange[200],
                                ),
                                child: Column(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceAround,
                                  children: [
                                    Icon(Icons.alarm, size: 35),
                                    Text(
                                      "prayTime".tr(),
                                      style: TextStyle(fontSize: 17),
                                      textAlign: TextAlign.center,
                                    )
                                  ],
                                ),
                              ),
                            ),
                            InkWell(
                              onTap: () {
                                MainScreenFunctions.languageDialog(context);
                              },
                              child: Container(
                                  height:
                                      MediaQuery.of(context).size.height * 0.14,
                                  width:
                                      MediaQuery.of(context).size.width * 0.23,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(15),
                                    color: Colors.orange[200],
                                  ),
                                  child: Column(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceAround,
                                    children: [
                                      Icon(
                                        Icons.language,
                                        size: 35,
                                      ),
                                      Text(
                                        "changeLang".tr(),
                                        style: TextStyle(fontSize: 17),
                                        textAlign: TextAlign.center,
                                      )
                                    ],
                                  )),
                            )
                          ],
                        ),
                      ],
                    ),
                  ),
                ]),
          ],
        ));
  }
}
