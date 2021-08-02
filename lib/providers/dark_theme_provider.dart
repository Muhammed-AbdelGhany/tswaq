import 'package:flutter/material.dart';

import 'package:tswaq/helpers/shared_prefrences.dart';

class DarkThemeProvider with ChangeNotifier {
  bool _darkTheme = false;
  bool get darkTheme => _darkTheme;

  set darkTheme(bool isDarkTheme) {
    _darkTheme = isDarkTheme;
    saveTheme(isDarkTheme);
    notifyListeners();
  }
}
