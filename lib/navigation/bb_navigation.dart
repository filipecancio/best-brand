import 'package:flutter/material.dart';

enum BBNavigationType {
  home,
  detail,
}

class BBNavigation extends ChangeNotifier {
  BBNavigationType _currentNavigation = BBNavigationType.home;

  BBNavigationType get currentNavigation => _currentNavigation;

  void navigateTo(BBNavigationType navigationType) {
    _currentNavigation = navigationType;
    notifyListeners();
  }

}
