import 'package:flutter/material.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({Key? key}) : super(key: key);

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
          CircleAvatar(
            radius: 70,
            backgroundImage: NetworkImage(
                "https://miro.medium.com/fit/c/1360/1360/2*uIHWWxBRQYGZrSdQ9WqPVA.png"),
          ),
          SizedBox(
            height: 20.0,
          ),
          Text(
            "สามิตร โกยม",
            style: TextStyle(color: Colors.white, fontSize: 32.0),
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
                      style: TextStyle(color: Colors.white, fontSize: 30.0),
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
                      style: TextStyle(color: Colors.white, fontSize: 30.0),
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
                      style: TextStyle(color: Colors.white, fontSize: 30.0),
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
                    fontSize: 18.0,
                  )),
            ),
          )
        ],
      ),
    ));
  }
}
