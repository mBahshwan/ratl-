import 'package:adhan_dart/adhan_dart.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:geocoding/geocoding.dart';

import 'package:geolocator/geolocator.dart';
import 'package:jiffy/jiffy.dart';
import 'package:quran_app/view_models/prayerTimings.dart';

class AdhanTimeTable extends StatefulWidget {
  AdhanTimeTable({Key? key}) : super(key: key);

  @override
  State<AdhanTimeTable> createState() => _AdhanTimeTableState();
}

class _AdhanTimeTableState extends State<AdhanTimeTable> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.orange[100],
      appBar: AppBar(
          backgroundColor: Colors.orange[300],
          centerTitle: true,
          title: Text("PT".tr())),
      body: FutureBuilder<Position>(
        future: Geolocator.getCurrentPosition(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            Coordinates coordinates =
                Coordinates(snapshot.data!.latitude, snapshot.data!.longitude);
            DateTime date = DateTime.now();
            CalculationParameters params = CalculationMethod.Karachi();
            params.madhab = Madhab.Hanafi;
            PrayerTimes prayerTimes =
                PrayerTimes(coordinates, date, params, precision: true);

            return Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                      height: MediaQuery.of(context).size.height * 0.2,
                      width: MediaQuery.of(context).size.width,
                      decoration: BoxDecoration(
                          color: Colors.orange[200],
                          borderRadius: BorderRadius.all(Radius.circular(25)),
                          border: Border.all(
                            color: Colors.black,
                            width: 3,
                          )),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Text("${Jiffy(DateTime.now()).yMMMMd}",
                              style: TextStyle(
                                  fontSize: 20, fontWeight: FontWeight.bold)),
                          Text("NE".tr() + "${prayerTimes.nextPrayer()}",
                              style: TextStyle(
                                  fontSize: 16, fontWeight: FontWeight.bold)),
                          StreamBuilder(
                              stream: PrayerTimingFunctions.remainingTime(
                                  prayerTimes),
                              builder: (context, snapshot) {
                                return Text(
                                    "remT".tr() +
                                        " : " +
                                        "${snapshot.data ?? ""}",
                                    style: TextStyle(
                                        fontSize: 16,
                                        fontWeight: FontWeight.bold));
                              })
                        ],
                      )),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Text("f".tr(),
                          style: TextStyle(
                              fontSize: 20, fontWeight: FontWeight.bold)),
                      Text(
                          "${DateFormat.jm().format(prayerTimes.fajr!.toLocal())}",
                          style: TextStyle(
                              fontSize: 16, fontWeight: FontWeight.bold))
                    ],
                  ),
                  Divider(
                    color: Colors.black,
                    thickness: 1,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Text("d".tr(),
                          style: TextStyle(
                              fontSize: 20, fontWeight: FontWeight.bold)),
                      Text(
                          "${DateFormat.jm().format(prayerTimes.dhuhr!.toLocal())}",
                          style: TextStyle(
                              fontSize: 16, fontWeight: FontWeight.bold))
                    ],
                  ),
                  Divider(
                    color: Colors.black,
                    thickness: 1,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Text("a".tr(),
                          style: TextStyle(
                              fontSize: 20, fontWeight: FontWeight.bold)),
                      Text(
                          "${DateFormat.jm().format(prayerTimes.asr!.toLocal())}",
                          style: TextStyle(
                              fontSize: 16, fontWeight: FontWeight.bold))
                    ],
                  ),
                  Divider(
                    color: Colors.black,
                    thickness: 1,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Text("m".tr(),
                          style: TextStyle(
                              fontSize: 20, fontWeight: FontWeight.bold)),
                      Text(
                          "${DateFormat.jm().format(prayerTimes.maghrib!.toLocal())}",
                          style: TextStyle(
                              fontSize: 16, fontWeight: FontWeight.bold))
                    ],
                  ),
                  Divider(
                    color: Colors.black,
                    thickness: 1,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Text("i".tr(),
                          style: TextStyle(
                              fontSize: 20, fontWeight: FontWeight.bold)),
                      Text(
                          "${DateFormat.jm().format(prayerTimes.isha!.toLocal())}",
                          style: TextStyle(
                              fontSize: 16, fontWeight: FontWeight.bold))
                    ],
                  ),
                  Divider(
                    color: Colors.black,
                    thickness: 1,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Text("s".tr(),
                          style: TextStyle(
                              fontSize: 20, fontWeight: FontWeight.bold)),
                      Text(
                          "${DateFormat.jm().format(prayerTimes.sunrise!.toLocal())}",
                          style: TextStyle(
                              fontSize: 16, fontWeight: FontWeight.bold))
                    ],
                  ),
                  SizedBox()
                ]);
          }
          return Center(
            child: Text("No Location permission"),
          );
        },
      ),
    );
  }
}
