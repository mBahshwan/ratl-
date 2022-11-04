import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

class SurahOfTime {
  String title = "";
  String content = "";
  String suratulEkhlasTitle = "eTitle".tr();
  String suratulEkhlasContent = "eContent".tr();
  String suratulkahfTitle = "kTitle".tr();
  String suratulkahfcontent = "kContent".tr();
  String showtitleOfTime() {
    DateTime date = DateTime.now();
    if (date.weekday == 5) {
      return title = suratulkahfTitle;
    } else {
      return title = suratulEkhlasTitle;
    }
  }

  String showContentOfTime() {
    DateTime date = DateTime.now();
    if (date.weekday == 5) {
      return content = suratulkahfcontent;
    } else {
      return content = suratulEkhlasContent;
    }
  }
}
