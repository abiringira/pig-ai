
import 'package:flutter/material.dart';

class WalkThroughProvider extends ChangeNotifier {

  int _currentPage = 0;

  void onPageChanged (int nextPage) {
    _currentPage = nextPage;
    notifyListeners();
  }

  int get currentPageValue => _currentPage;

}