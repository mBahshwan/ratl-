import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:quran_app/models/adhkar_model.dart';

class AdhkarProvider extends ChangeNotifier {
  bool isTranslated = false;
  List<String> translateDua(
      {required List<String> contentTranlated,
      required List<String> contentNotTranslated}) {
    if (isTranslated == true) {
      return contentTranlated;
    } else {
      return contentNotTranslated;
    }
  }

  void translateScript() {
    isTranslated = !isTranslated;

    notifyListeners();
  }
}
