// ignore_for_file: unnecessary_null_comparison
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_line_sdk/flutter_line_sdk.dart';
import 'package:fluttermusic/screens/login/progress.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LoginScreen extends StatefulWidget {
  LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {

  late BuildContext _progressContext;
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: 
          Container(
            height: 200,
            child: GestureDetector(
              child: Image.asset('assets/images/Line-Logo.png'),
              onTap: _lineLogin,
            ),
          )
      ),
    );
  }

  // ฟังก์ชัน Line Login
  _lineLogin() async {
    {
      try {
        showDialog(
          context: context,
          builder: (BuildContext context) {
            _progressContext = context;
            return ProgressDialog();
          });

        final result = await LineSDK.instance
            .login(scopes: ["profile", "openid", "email"]);
        if (result != null) {
          Navigator.pop(_progressContext);

          // print(result.userProfile!.displayName);
          // print(result.userProfile!.pictureUrl);
          // print(result.userProfile!.statusMessage);
          // print(result.userProfile!.userId);
          
          // print('Login Success');
          // อ่านข้อมูล Profile และเก็บลงตัวแปรแบบ SharedPreferences 
          SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
          sharedPreferences.setString('displayName', result.userProfile!.displayName);
          sharedPreferences.setString('pictureUrl', result.userProfile!.pictureUrl.toString());
          sharedPreferences.setString('statusMessage', result.userProfile!.statusMessage.toString());
          sharedPreferences.setString('userId', result.userProfile!.userId);

          // ส่งไปหน้า MainPage
          Navigator.pushNamed(context, '/mainpage');
        }
      } on PlatformException catch (e) {
        // Error handling.
        print(e.stacktrace);
        Navigator.pop(context); // หากกดไม่อนุญาติ
      }
    }
  }


}