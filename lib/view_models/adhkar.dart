import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:quran_app/models/adhkar_model.dart';
import 'package:quran_app/providers/adkhar_provider.dart';

class AdhkarFunctions {
  String sleepingDua = "sleepingDua".tr();
  String sleepingDuaTranslated =
      "‘In Your name my Lord, I lie down and in Your name I rise, so if You should take my soul then have mercy upon it, and if You should return my soul then protect it in the manner You do so with Your righteous servants.’";
  String sleepingDuaType = "SR".tr();
  String wakeUpDua = "wakeUpDua".tr();
  String wakeUpDuaTranslated =
      "All praise is for Allah who gave us life after having taken it from us and unto Him is the resurrection";
  String wakeUpDuaType = "WUR".tr();
  List<String> dhkersAfterSalah = [
    "RAP1".tr(),
    "RAP2".tr(),
    "RAP3".tr(),
    "RAP4".tr(),
    "RAP5".tr(),
    "RAP6".tr(),
    "RAP7".tr(),
  ];
  List<String> dhkersAfterSalahTranslated = [
    "‘I ask Allah for forgiveness.’ (three times) ‘O Allah, You are As-Salam and from You is all peace, blessed are You, O Possessor of majesty and honour.’ AS-Salam: The One Who is free from all defects and deficiencies., ",
    "‘None has the right to be worshipped except Allah, alone, without partner, to Him belongs all sovereignty and praise and He is over all things omnipotent.O Allah, none can prevent what You have willed to bestow and none can bestow what You have willed to prevent, and no wealth or majesty can benefit anyone, as from You is all wealth and majesty., ",
    "‘None has the right to be worshipped except Allah, alone, without partner, to Him belongs all sovereignty and praise and He is over all things omnipotent. There is no might nor power except with Allah, none has the right to be worshipped except Allah and we worship none except Him. For Him is all favour, grace, and glorious praise. None has the right to be worshipped except Allah and we are sincere in faith and devotion to Him although the disbelievers detest it., ",
    "‘How perfect Allah is, all praise is for Allah, and Allah is the greatest.’ (thirty-three times) ‘None has the right to be worshipped except Allah, alone, without partner, to Him belongs all sovereignty and praise and He is over all things omnipotent., ",
    "Reading surah Al-Ikhlas, Al-Falaq, and An-nas (3 times After fajr and magrib prayers. After the other prayers 1 time.), ",
    "Ayatul-kursi (one time),",
    "‘None has the right to be worshipped except Allah, alone, without partner, to Him belongs all sovereignty and praise, He gives life and causes death and He is over all things omnipotent.’ (ten times after the maghrib and fajr prayers)"
  ];

  List<String> afzalulTasbih = [
    "hadith".tr(),
    "AF1".tr(),
    "AF2".tr(),
    "AF3".tr(),
    "AF4".tr(),
    "AF5".tr(),
    "AF6".tr(),
    "AF7".tr(),
    "AF8".tr(),
  ];

  List<String> duaAlEstekhara = ["DE1".tr(), "DE2".tr()];
  List<String> duaAlEstekharaTranslated = [
    "(O Allah! I ask guidance from Your knowledge, And Power from Your Might and I ask for Your great blessings. You are capable and I am not. You know and I do not and You know the unseen.)",
    "(O Allah, if You know this matter is good for me in the immediate and future of my affair, and in my religion, my livelihood, my livelihood and the outcome of my affair, then decree it for me and make it easy for me, then bless me in it. O Allah, and if You know that this matter is bad for me in my religion, my livelihood and the outcome of my affair, and in the immediate and the end of my affair, then turn me away from it and decree for me the good wherever it is, then please me with it.)"
  ];

  Future<dynamic> afzalTasbihDialog(
      {required BuildContext context, required AdhkarModel adhkarModel}) {
    return showDialog(
        context: context,
        builder: (context) => Consumer<AdhkarProvider>(
              builder: (context, value, child) => Dialog(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(Radius.circular(25))),
                  backgroundColor: Colors.brown[200],
                  child: ListView(
                    children: [
                      Text(
                        adhkarModel.title.toString(),
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 30),
                      ),
                      Divider(
                        color: Colors.black,
                        thickness: 2,
                      ),
                      ListView.builder(
                        shrinkWrap: true,
                        physics: NeverScrollableScrollPhysics(),
                        itemCount: adhkarModel.content.length,
                        itemBuilder: (context, index) {
                          return Column(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Text(
                                adhkarModel.content[index],
                                style: TextStyle(
                                    fontFamily: 'AmiriQuran', fontSize: 20),
                                textAlign: TextAlign.center,
                              ),
                              Divider(
                                color: Colors.black,
                                thickness: 1,
                              )
                            ],
                          );
                        },
                      ),
                    ],
                  )),
            ));
  }

  Future<dynamic> afterSalahDialog(
      {required BuildContext context, required AdhkarModel adhkarModel}) {
    return showDialog(
        context: context,
        builder: (context) => Consumer<AdhkarProvider>(
              builder: (context, value, child) => Dialog(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(Radius.circular(25))),
                  backgroundColor: Colors.brown[200],
                  child: ListView(
                    children: [
                      Text(
                        adhkarModel.title.toString(),
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 30),
                      ),
                      Divider(
                        color: Colors.black,
                        thickness: 2,
                      ),
                      ListView.builder(
                        shrinkWrap: true,
                        physics: NeverScrollableScrollPhysics(),
                        itemCount: 1,
                        itemBuilder: (context, index) {
                          return Column(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Text(
                                value
                                    .translateDua(
                                        contentTranlated:
                                            dhkersAfterSalahTranslated,
                                        contentNotTranslated: dhkersAfterSalah)
                                    .toString(),
                                style: TextStyle(
                                    fontFamily: 'AmiriQuran', fontSize: 20),
                                textAlign: TextAlign.center,
                              ),
                              Divider(
                                color: Colors.black,
                                thickness: 1,
                              )
                            ],
                          );
                        },
                      ),
                      Container(
                        margin: EdgeInsets.symmetric(horizontal: 50),
                        child: MaterialButton(
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(25)),
                            color: Colors.grey,
                            child: Text("see tranlastion ..."),
                            onPressed: () {
                              value.translateScript();
                            }),
                      )
                    ],
                  )),
            ));
  }

  Future<dynamic> IstikharaDialog(
      {required BuildContext context, required AdhkarModel adhkarModel}) {
    return showDialog(
        context: context,
        builder: (context) => Consumer<AdhkarProvider>(
              builder: (context, value, child) => Dialog(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(Radius.circular(25))),
                  backgroundColor: Colors.brown[200],
                  child: ListView(
                    children: [
                      Text(
                        adhkarModel.title.toString(),
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 30),
                      ),
                      Divider(
                        color: Colors.black,
                        thickness: 2,
                      ),
                      ListView.builder(
                        shrinkWrap: true,
                        physics: NeverScrollableScrollPhysics(),
                        itemCount: 1,
                        itemBuilder: (context, index) {
                          return Column(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Text(
                                value
                                    .translateDua(
                                        contentTranlated:
                                            duaAlEstekharaTranslated.toList(),
                                        contentNotTranslated:
                                            duaAlEstekhara.toList())
                                    .toString(),
                                style: TextStyle(
                                    fontFamily: 'AmiriQuran', fontSize: 20),
                                textAlign: TextAlign.center,
                              ),
                              Divider(
                                color: Colors.black,
                                thickness: 1,
                              )
                            ],
                          );
                        },
                      ),
                      Container(
                        margin: EdgeInsets.symmetric(horizontal: 50),
                        child: MaterialButton(
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(25)),
                            color: Colors.grey,
                            child: Text("see tranlastion ..."),
                            onPressed: () {
                              value.translateScript();
                            }),
                      )
                    ],
                  )),
            ));
  }

  Future<dynamic> sleepingDuaDialog(
      {required BuildContext context, required AdhkarModel adhkarModel}) {
    return showDialog(
        context: context,
        builder: (context) => Dialog(
              backgroundColor: Colors.brown[200],
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(Radius.circular(25))),
              child: Consumer<AdhkarProvider>(builder: (context, value, child) {
                return Column(mainAxisSize: MainAxisSize.min, children: [
                  Text(
                    adhkarModel.title,
                    textAlign: TextAlign.center,
                    style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
                  ),
                  Text(
                    "${value.translateDua(contentTranlated: [
                          sleepingDuaTranslated
                        ], contentNotTranslated: [
                          sleepingDua
                        ])}",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 25,
                    ),
                  ),
                  MaterialButton(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(25)),
                      color: Colors.grey,
                      child: Text("see tranlastion ..."),
                      onPressed: () {
                        value.translateScript();
                      })
                ]);
              }),
            ));
  }

  Future<dynamic> wakeUpDuaDialog(
      {required BuildContext context, required AdhkarModel adhkarModel}) {
    return showDialog(
        context: context,
        builder: (context) => Dialog(
              backgroundColor: Colors.brown[200],
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(Radius.circular(25))),
              child: Consumer<AdhkarProvider>(builder: (context, value, child) {
                return Column(mainAxisSize: MainAxisSize.min, children: [
                  Text(
                    adhkarModel.title,
                    textAlign: TextAlign.center,
                    style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
                  ),
                  Text(
                    value.translateDua(
                        contentTranlated: [wakeUpDuaTranslated],
                        contentNotTranslated: [wakeUpDua]).toString(),
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 25,
                    ),
                  ),
                  MaterialButton(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(25)),
                      color: Colors.grey,
                      child: Text("see tranlastion ..."),
                      onPressed: () {
                        value.translateScript();
                      })
                ]);
              }),
            ));
  }

  Future<dynamic> morningEveningDuaDialog(BuildContext context) {
    return showDialog(
      context: context,
      builder: (context) {
        String morEveDua = "MED".tr();
        String morEveDuaTranslated =
            "“We have reached the Morning (evening) and at this very time unto Allah belongs all sovereignty, and all praise is for Allah. None has the right to be worshipped except Allah, Alone without any partner, to Him belongs all sovereignty and praise and He is over all things omnipotent. My Lord, I ask You for the good of this Morning (night) and the good of what follows it and I seek refuge in You from the evil of this Morning (night) and the evil of what follows it. My Lord, I seek refuge in You from laziness and senility. My Lord, I seek refuge in You from torment in the Hell Fire and torment in the grave.”";
        String threeTimes = "threeTimes".tr();
        String threeTimesAtNight = "threeTimesAtNight".tr();
        String askAllahAfia = "askAllahAfia".tr();
        String InTheNameOfAllah = "InTheNameOfAllah".tr();
        String InTheNameOfAllahTranslated =
            "“In the name of Allah with whose Name nothing is harmful on Earth nor in the Heavens and He is the All-Hearing, the All-Knowing";
        String askAllahAfiaTranslated =
            "“O Allah, I ask You for pardon and well-being in this life and in the Here-After. O Allah, I ask You for pardon and well-being in my religion and worldly affairs, and my family and my wealth. O Allah, veil my ‘Awrah (everything privet you do not want anyone to see from your body and others, or your weakness) and set at ease my dismay. O Allah, preserve me from the front, the back(behind), my right, my left and from above, and I seek refuge in Your Greatness that I may be attacked from below";
        String seydulEstigfar = "seydulEstigfar".tr();
        String seydulEstigfarTranslated =
            "“O Allah, You are my Lord, none has the right to be worshipped except You, You have created me and I am your servant and I abide to Your covenant and promise as best as I can, I seek refuge in You from the evil of what I have done (wrong), I acknowledge Your favor upon me and I acknowledge my sin, so forgive me, for none forgives sins except You";
        String ayahtulKursi =
            "ٱللَّهُ لَآ إِلَـٰهَ إِلَّا هُوَ ٱلْحَىُّ ٱلْقَيُّومُ ۚ لَا تَأْخُذُهُۥ سِنَةٌۭ وَلَا نَوْمٌۭ ۚ لَّهُۥ مَا فِى ٱلسَّمَـٰوَٰتِ وَمَا فِى ٱلْأَرْضِ ۗ مَن ذَا ٱلَّذِى يَشْفَعُ عِندَهُۥٓ إِلَّا بِإِذْنِهِۦ ۚ يَعْلَمُ مَا بَيْنَ أَيْدِيهِمْ وَمَا خَلْفَهُمْ ۖ وَلَا يُحِيطُونَ بِشَىْءٍۢ مِّنْ عِلْمِهِۦٓ إِلَّا بِمَا شَآءَ ۚ وَسِعَ كُرْسِيُّهُ ٱلسَّمَـٰوَٰتِ وَٱلْأَرْضَ ۖ وَلَا يَـُٔودُهُۥ حِفْظُهُمَا ۚ وَهُوَ ٱلْعَلِىُّ ٱلْعَظِيمُ ";
        String seekRefuge = "seekRefuge".tr();
        String seekRefugeTranslated =
            "“I seek refuge in the perfect words of Allah from the Evil of what He has created";

        return Consumer<AdhkarProvider>(
          builder: (context, value, child) => Dialog(
            backgroundColor: Colors.brown[200],
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(25))),
            child: ListView(children: [
              Text(
                textAlign: TextAlign.center,
                "MER".tr(),
                style: TextStyle(
                  fontSize: 30,
                ),
              ),
              Divider(
                color: Colors.black,
                thickness: 2,
              ),
              Text(
                textAlign: TextAlign.center,
                ayahtulKursi,
                style: TextStyle(fontFamily: 'AmiriQuran', fontSize: 17),
              ),
              Divider(
                color: Colors.black,
                thickness: 1,
              ),
              Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Text(
                        "SI".tr(),
                        style: TextStyle(fontSize: 19),
                      ),
                      Text("SF".tr(), style: TextStyle(fontSize: 19)),
                      Text("SN".tr(), style: TextStyle(fontSize: 19))
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Text(threeTimes),
                      Text(threeTimes),
                      Text(threeTimes),
                    ],
                  )
                ],
              ),
              Divider(
                color: Colors.black,
                thickness: 1,
              ),
              Text(
                value.isTranslated == false
                    ? seydulEstigfar
                    : seydulEstigfarTranslated,
                style: TextStyle(fontSize: 19, fontFamily: 'AmiriQuran'),
                textAlign: TextAlign.center,
              ),
              Divider(
                color: Colors.black,
                thickness: 1,
              ),
              Text(
                  value.isTranslated == false
                      ? askAllahAfia
                      : askAllahAfiaTranslated,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 17,
                    fontFamily: 'AmiriQuran',
                  )),
              Divider(
                color: Colors.black,
                thickness: 1,
              ),
              Text(
                  textAlign: TextAlign.center,
                  value.isTranslated == false ? morEveDua : morEveDuaTranslated,
                  style: TextStyle(
                    fontSize: 19,
                    fontFamily: 'Kitab',
                  )),
              Divider(
                color: Colors.black,
                thickness: 1,
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    textAlign: TextAlign.center,
                    value.isTranslated == false
                        ? InTheNameOfAllah
                        : InTheNameOfAllahTranslated,
                    style: TextStyle(fontSize: 19, fontFamily: 'AmiriQuran'),
                  ),
                  Text(threeTimes)
                ],
              ),
              Divider(
                color: Colors.black,
                thickness: 1,
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    textAlign: TextAlign.center,
                    value.isTranslated == false
                        ? seekRefuge
                        : seekRefugeTranslated,
                    style: TextStyle(fontSize: 19, fontFamily: 'AmiriQuran'),
                  ),
                  Text(threeTimesAtNight),
                  Divider(
                    color: Colors.black,
                    thickness: 1,
                  ),
                ],
              ),
              Container(
                margin: EdgeInsets.symmetric(horizontal: 50),
                child: MaterialButton(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(25)),
                    color: Colors.grey,
                    child: Text("see tranlastion ..."),
                    onPressed: () {
                      value.translateScript();
                    }),
              )
            ]),
          ),
        );
      },
    );
  }
}
