import 'package:flutter/material.dart';
class PlayerScreen extends StatefulWidget {

  PlayerScreen({Key? key}) : super(key: key);

  @override
  State<PlayerScreen> createState() => _PlayerScreenState();
}

class _PlayerScreenState extends State<PlayerScreen> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(
          color: Colors.white, //change your color here
        ),
        backgroundColor: Color(0x44000000),
        elevation: 0,
      ),
      body: Container(
        child: Text('Player Music'),
      ),
    );
  }
}

