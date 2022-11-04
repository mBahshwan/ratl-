// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:provider/provider.dart';
import 'package:quran_app/providers/tasbih_provider.dart';

class TasbihPage extends StatelessWidget {
  const TasbihPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.orange[50],
        body: Consumer<TasbihProvider>(
          builder: (context, value, child) => Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Container(
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                      boxShadow: [
                        BoxShadow(
                            spreadRadius: 20,
                            color: Colors.black.withOpacity(0.5),
                            blurRadius: 50,
                            blurStyle: BlurStyle.normal,
                            offset: Offset(0.0, 10))
                      ],
                      color: Colors.brown,
                      borderRadius: BorderRadius.all(Radius.circular(25))),
                  height: MediaQuery.of(context).size.height * 0.355,
                  child: Text(
                      textAlign: TextAlign.center,
                      "hadith".tr(),
                      style: TextStyle(fontSize: 23, color: Colors.white)),
                ),
                CircleAvatar(
                  radius: 50,
                  child: Text(value.count.toString(),
                      style: TextStyle(fontSize: 50, color: Colors.white)),
                  backgroundColor: Colors.brown[700],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    MaterialButton(
                        color: Colors.brown,
                        height: 60,
                        shape: OutlineInputBorder(
                            borderRadius:
                                BorderRadius.all(Radius.circular(25))),
                        onPressed: () {
                          value.resetCount();
                        },
                        child: Text(
                          "reset".tr(),
                          style: TextStyle(color: Colors.white, fontSize: 20),
                        )),
                    MaterialButton(
                        color: Colors.brown,
                        height: 60,
                        shape: OutlineInputBorder(
                            borderRadius:
                                BorderRadius.all(Radius.circular(25))),
                        onPressed: () {
                          value.incremeantCount();
                        },
                        child: Text(
                          "click".tr(),
                          style: TextStyle(color: Colors.white, fontSize: 20),
                        )),
                  ],
                ),
                Image.asset('assets/images/mosque.png'),
              ]),
        ),
      ),
    );
  }
}
