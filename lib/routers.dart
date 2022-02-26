import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'package:fluttermusic/screens/mainpage/mainpage_screen.dart';
import 'package:fluttermusic/screens/player/player_screen.dart';

// สร้างตัวแปรแบบ Map ไว้เก็บ URL และหน้า Screen
Map<String, WidgetBuilder> routes = {
  "/mainpage":(BuildContext context) => MainPageScreen(),
  "/player":(BuildContext context) => PlayerScreen(),
};
