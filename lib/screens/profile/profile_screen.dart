import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ProfileScreen extends StatefulWidget {
  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {

  // สร้าง Object SharedPreferences 
  late SharedPreferences sharedPreferences;

  // สร้างตัวแปรไว้เก็บข้อมูล Profile
  String displayName='', pictureUrl='', statusMessage='', userId='';

  // สร้างฟังก์ชันอ่านข้อมูล Profile
  getProfile() async {
    sharedPreferences = await SharedPreferences.getInstance();
    setState(() {
      displayName = sharedPreferences.getString('displayName')!;
      pictureUrl = sharedPreferences.getString('pictureUrl')!;
      statusMessage = sharedPreferences.getString('statusMessage')!;
      userId = sharedPreferences.getString('userId')!;
    });
  }

  @override
  void initState() {
    super.initState();
    getProfile();
  }

  @override
  Widget build(BuildContext context) {
    return Center(
        child: Padding(
      padding: const EdgeInsets.symmetric(vertical: 30.0, horizontal: 22.0),
      child: Column(
        children: <Widget>[
          SizedBox(
            height: 20.0,
          ),
          pictureUrl != '' ?
          CircleAvatar(
            radius: 70,
            backgroundImage: NetworkImage('$pictureUrl'),
          ): CircularProgressIndicator(),
          SizedBox(
            height: 20.0,
          ),
          Text(
            '$displayName',
            style: TextStyle(color: Colors.white, fontSize: 24.0),
          ),
          Text(
            '$statusMessage',
            style: TextStyle(color: Colors.white, fontSize: 16.0),
          ),
          SizedBox(
            height: 30.0,
          ),
          Row(
            children: <Widget>[
              Expanded(
                child: Column(
                  children: <Widget>[
                    Text(
                      "501",
                      style: TextStyle(color: Colors.white, fontSize: 24.0),
                    ),
                    SizedBox(
                      height: 5.0,
                    ),
                    Text(
                      "เพลง",
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 18.0,
                          fontWeight: FontWeight.w300),
                    ),
                  ],
                ),
              ),
              Expanded(
                child: Column(
                  children: <Widget>[
                    Text(
                      "20.1K",
                      style: TextStyle(color: Colors.white, fontSize: 24.0),
                    ),
                    SizedBox(
                      height: 5.0,
                    ),
                    Text(
                      "ผู้ติดตาม",
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 18.0,
                          fontWeight: FontWeight.w300),
                    ),
                  ],
                ),
              ),
              Expanded(
                child: Column(
                  children: <Widget>[
                    Text(
                      "1.2k",
                      style: TextStyle(color: Colors.white, fontSize: 24.0),
                    ),
                    SizedBox(
                      height: 5.0,
                    ),
                    Text(
                      "ติดตาม",
                      style: TextStyle(
                          fontSize: 18.0, fontWeight: FontWeight.w300),
                    ),
                  ],
                ),
              ),
            ],
          ),
          SizedBox(
            height: 20.0,
          ),
          Padding(
            padding: EdgeInsets.all(12.0),
            child: ElevatedButton(
              onPressed: () {},
              style: ElevatedButton.styleFrom(
                shape: new RoundedRectangleBorder(
                  borderRadius: new BorderRadius.circular(30.0),
                ),
                primary: Colors.greenAccent,
                padding: EdgeInsets.symmetric(horizontal: 30, vertical: 0),
              ),
              child: Text('แก้ไขโปรไฟล์',
                  style: TextStyle(
                    fontSize: 16.0,
                  )),
            ),
          ),
          Padding(
            padding: EdgeInsets.all(12.0),
            child: ElevatedButton(
              onPressed: () async {
                // เขียนคำสั่งล้างค่าออกจาก SharedPreferences
                sharedPreferences = await SharedPreferences.getInstance();
                sharedPreferences.clear();
                // ส่งกลับไปหน้า Login
                Navigator.pushNamed(context, '/login');
              },
              style: ElevatedButton.styleFrom(
                shape: new RoundedRectangleBorder(
                  borderRadius: new BorderRadius.circular(30.0),
                ),
                primary: Colors.redAccent,
                padding: EdgeInsets.symmetric(horizontal: 30, vertical: 0),
              ),
              child: Text('ออกจากระบบ',
                  style: TextStyle(
                    fontSize: 16.0,
                  )),
            ),
          )
        ],
      ),
    ));
  }
}