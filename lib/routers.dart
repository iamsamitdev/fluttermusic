import 'package:flutter/material.dart';
import 'package:fluttermusic/screens/mainpage/mainpage_screen.dart';

// สร้างตัวแปรแบบ Map ไว้เก็บ URL และหน้า Screen
Map<String, WidgetBuilder> routes = {
  "/mainpage":(BuildContext context) => MainPageScreen(),
};
