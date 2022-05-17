import 'package:flutter/material.dart';
import 'package:fluttermusic/routers.dart';
import 'package:fluttermusic/themes/style.dart';
import 'package:flutter_line_sdk/flutter_line_sdk.dart';
import 'package:shared_preferences/shared_preferences.dart';

var userId = '';

void main() async {

  WidgetsFlutterBinding.ensureInitialized(); // อนุญาติการใช้งาน Widget ภายนอก

  // สร้าง Object SharedPreferences 
  SharedPreferences sharedPreferences = await SharedPreferences.getInstance();

  // อ่านค่า userId
  if(sharedPreferences.getString('userId') != null){
    userId = sharedPreferences.getString('userId')!;
  }
  
  // เรียกใช้งาน Line SDK
  var chanelID = '1656947110';
  LineSDK.instance.setup("${chanelID}").then((_) {
    print("LineSDK Ready");
  });

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: appTheme(),
      initialRoute: userId != '' ? '/mainpage':'/login',
      routes: routes,
    );
  }
}
