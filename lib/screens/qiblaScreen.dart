import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_qiblah/flutter_qiblah.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:location/location.dart';
import 'dart:math' as math;

import 'package:permission_handler/permission_handler.dart';

class Compass extends StatefulWidget {
  @override
  _CompassState createState() => _CompassState();
}

class _CompassState extends State<Compass> {
  bool _hasPermissions = false;
  Location location = Location();
  Stream<LocationData>? locationData;

  @override
  void initState() {
    locationData = location.onLocationChanged;
    super.initState();
    checkPermission();
  }

  void checkPermission() async {
    if (await Permission.locationWhenInUse.isGranted) {
      setState(() {
        _hasPermissions = true;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.orange[50],
      body: Stack(
        children: [
          Image.asset("assets/images/background.png",
              fit: BoxFit.fill, height: MediaQuery.of(context).size.height),
          Positioned(
              right: 0,
              child: Image.asset(
                "assets/icons/lanterns.png",
                height: 100,
              )),
          Builder(builder: (context) {
            if (_hasPermissions) {
              return Column(
                children: <Widget>[
                  Expanded(child: _buildCompass()),
                ],
              );
            } else {
              return _buildPermissionSheet();
            }
          }),
        ],
      ),
    );
  }

  Widget _buildCompass() {
    return StreamBuilder<QiblahDirection>(
      stream: FlutterQiblah.qiblahStream,
      builder: (context, snapshot) {
        if (snapshot.hasError) {
          return Text('Error reading heading: ${snapshot.error}');
        }

        if (!snapshot.hasData) {
          return Center(
            child: Container(
              width: 32,
              height: 32,
              child: CircularProgressIndicator(),
            ),
          );
        }

        final qiblahDirection = snapshot.data;
        var _angle = ((qiblahDirection!.qiblah) * (math.pi / 180) * -1);
        final _kaabaSvg = SvgPicture.asset('assets/images/4.svg');

        return Stack(
          alignment: Alignment.center,
          children: <Widget>[
            Transform.rotate(
              angle: _angle,
              child: SvgPicture.asset('assets/images/5.svg', // compass
                  color: Colors.green),
            ),
            _kaabaSvg,
            SvgPicture.asset('assets/images/3.svg', //needle
                color: Colors.green),
            Align(
              alignment: Alignment.bottomCenter,
              child: Text(
                "msg1".tr() + '\n' + "msg2".tr() + '\n' + "msg3".tr(),
                textAlign: TextAlign.center,
              ),
            )
          ],
        );
      },
    );
  }

  Widget _buildPermissionSheet() {
    return Container(
      padding: EdgeInsets.all(20),
      child: Column(
        children: <Widget>[
          Spacer(),
          Text('Location Permission Required'),
          Spacer(),
          SizedBox(
            width: double.infinity,
            child: OutlinedButton(
              child: Text('Request Permissions'),
              onPressed: () async {
                await Permission.locationWhenInUse
                    .request()
                    .isGranted
                    .then((value) {
                  setState(() {
                    _hasPermissions = value;
                  });
                });
              },
            ),
          ),
        ],
      ),
    );
  }
}
