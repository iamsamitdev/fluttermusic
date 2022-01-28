import 'package:flutter/material.dart';
import 'package:fluttermusic/routers.dart';
import 'package:fluttermusic/themes/style.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: appTheme(),
      initialRoute: '/mainpage',
      routes: routes,
    );
  }
}
