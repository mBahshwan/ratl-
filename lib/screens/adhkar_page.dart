import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:quran_app/external_icons/my_flutter_app_icons.dart';
import 'package:quran_app/models/adhkar_model.dart';
import 'package:quran_app/providers/adkhar_provider.dart';
import 'package:quran_app/view_models/adhkar.dart';

class adhkarPage extends StatelessWidget {
  const adhkarPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    AdhkarFunctions _AF = AdhkarFunctions();
    return Scaffold(
        backgroundColor: Colors.orange[100],
        body: Consumer<AdhkarProvider>(
          builder: (context, value, child) => Stack(
            children: [
              Positioned(
                  right: 0,
                  child: Image.asset(
                    "assets/icons/lanterns.png",
                    height: 100,
                  )),
              Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text("الاذكار",
                      style: TextStyle(fontSize: 80, fontFamily: 'aldhabi')),
                  SizedBox(height: 50),
                  Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          InkWell(
                              onTap: () {
                                AdhkarModel a4 = AdhkarModel(
                                    title: _AF.sleepingDuaType,
                                    content: [_AF.sleepingDua]);
                                _AF.sleepingDuaDialog(
                                    context: context, adhkarModel: a4);
                              },
                              child: Container(
                                alignment: Alignment.center,
                                height: 80,
                                width: 120,
                                color: Colors.red,
                                child: Text(
                                  _AF.sleepingDuaType,
                                  style: TextStyle(
                                      fontSize: 17,
                                      fontWeight: FontWeight.bold),
                                  textAlign: TextAlign.center,
                                ),
                              )),
                          InkWell(
                            onTap: () {
                              AdhkarModel a5 = AdhkarModel(
                                  title: _AF.wakeUpDuaType,
                                  content: [_AF.wakeUpDua]);
                              _AF.wakeUpDuaDialog(
                                  context: context, adhkarModel: a5);
                            },
                            child: Container(
                              alignment: Alignment.center,
                              height: 80,
                              width: 120,
                              color: Colors.blue,
                              child: Text(
                                _AF.wakeUpDuaType,
                                style: TextStyle(
                                    fontSize: 17, fontWeight: FontWeight.bold),
                                textAlign: TextAlign.center,
                              ),
                            ),
                          ),
                          InkWell(
                            onTap: () {
                              _AF.morningEveningDuaDialog(context);
                            },
                            child: Container(
                              alignment: Alignment.center,
                              height: 80,
                              width: 120,
                              color: Colors.green,
                              child: Text(
                                "MER".tr(),
                                style: TextStyle(
                                    fontSize: 17, fontWeight: FontWeight.bold),
                                textAlign: TextAlign.center,
                              ),
                            ),
                          )
                        ],
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          InkWell(
                            onTap: () {
                              AdhkarModel a1 = AdhkarModel(
                                  title: "VTTTT".tr(),
                                  content: _AF.afzalulTasbih);
                              _AF.afzalTasbihDialog(
                                  context: context, adhkarModel: a1);
                            },
                            child: Container(
                              alignment: Alignment.center,
                              height: 80,
                              width: 120,
                              color: Colors.brown,
                              child: Text(
                                "VTTTT".tr(),
                                style: TextStyle(
                                    fontSize: 14, fontWeight: FontWeight.bold),
                                textAlign: TextAlign.center,
                              ),
                            ),
                          ),
                          InkWell(
                            onTap: () {
                              AdhkarModel a2 = AdhkarModel(
                                  title: "RAP".tr(),
                                  content: _AF.dhkersAfterSalah);
                              _AF.afterSalahDialog(
                                  context: context, adhkarModel: a2);
                            },
                            child: Container(
                              alignment: Alignment.center,
                              height: 80,
                              width: 120,
                              color: Colors.amber,
                              child: Text(
                                "RAP".tr(),
                                style: TextStyle(
                                    fontSize: 17, fontWeight: FontWeight.bold),
                                textAlign: TextAlign.center,
                              ),
                            ),
                          ),
                          InkWell(
                            onTap: () {
                              AdhkarModel a3 = AdhkarModel(
                                  title: "IR".tr(),
                                  content: _AF.duaAlEstekhara);
                              _AF.IstikharaDialog(
                                  context: context, adhkarModel: a3);
                            },
                            child: Container(
                                alignment: Alignment.center,
                                height: 80,
                                width: 120,
                                color: Colors.cyan,
                                child: Text(
                                  "IR".tr(),
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                      fontSize: 17,
                                      fontWeight: FontWeight.bold),
                                )),
                          )
                        ],
                      ),
                    ],
                  ),
                  Image.asset('assets/images/duaImage.jpg')
                ],
              ),
            ],
          ),
        ));
  }
}
