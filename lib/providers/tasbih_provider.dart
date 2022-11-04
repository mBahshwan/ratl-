import 'package:flutter/material.dart';

class TasbihProvider extends ChangeNotifier {
  int count = 0;

  void incremeantCount() {
    count++;
    notifyListeners();
  }

  void resetCount() {
    count = 0;
    notifyListeners();
  }
}
