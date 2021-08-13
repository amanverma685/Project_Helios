import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:helios/Themes/BlueTheme.dart';
import 'package:helios/Themes/DarkTheme.dart';

class AppTheme extends ChangeNotifier {
  ThemeData defaultTheme = blueTheme;

  void changeAppTheme(bool data) {
    if (data == true) {
      defaultTheme = darkTheme;
    } else
      defaultTheme = blueTheme;
    notifyListeners();
  }
}
