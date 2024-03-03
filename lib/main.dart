import 'package:flutter/material.dart';
import 'package:noticiario/pages/home.dart';
import 'package:noticiario/theme/theme.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Noticiario',
      home: HomeManager(),
      theme: lightMode,
      darkTheme: darkMode,
      builder: (context, child) {
        return MediaQuery(
          data: MediaQuery.of(context).copyWith(alwaysUse24HourFormat: false),
          child: child ?? Container(), // Add a non-null default widget
        );
      },
    );
  }
}