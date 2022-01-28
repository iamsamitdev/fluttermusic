import 'package:flutter/material.dart';

ThemeData appTheme() {
  return ThemeData(
    fontFamily: 'NotoSansThai',
    colorScheme: ColorScheme.fromSwatch(
      primarySwatch: Colors.grey,
      accentColor: Color(0xffeeeeee),
    ).copyWith(
      secondary: Colors.white
    ),
    textTheme: const TextTheme(
      bodyText2: TextStyle(color: Colors.white)
    ),
    scaffoldBackgroundColor: Color(0xff000000)
  );
}