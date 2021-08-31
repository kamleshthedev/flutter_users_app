import 'package:flutter/material.dart';

import 'theme_index.dart';

ThemeData appTheme() {
  return ThemeData(
    appBarTheme: appBarTheme(),
    scaffoldBackgroundColor: kBackgroundColor,
  );
}

AppBarTheme appBarTheme() {
  return AppBarTheme(
    centerTitle: true,
    brightness: Brightness.dark,
    backgroundColor: kPrimaryColor,
  );
}
