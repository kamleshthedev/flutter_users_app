import 'package:flutter/material.dart';

import '/pages/pages_index.dart';
import '/theme/app_theme.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Task App',
      theme: appTheme(),
      home: HomePage(),
    );
  }
}
