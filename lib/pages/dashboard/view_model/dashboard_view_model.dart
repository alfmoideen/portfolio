import 'package:flutter/material.dart';

class DashboardViewModel extends ChangeNotifier {
  int pageIndex = 0;

  changeIndex(int index) {
    pageIndex = index;
    notifyListeners();
  }
}
