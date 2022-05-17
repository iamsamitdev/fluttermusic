import 'package:flutter/material.dart';
import 'package:audioplayers/audioplayers.dart';
import 'audio_file.dart';

class PlayerScreen extends StatefulWidget {
  PlayerScreen({Key? key}) : super(key: key);

  @override
  State<PlayerScreen> createState() => _PlayerScreenState();
}

class _PlayerScreenState extends State<PlayerScreen> {
  late AudioPlayer player;

  @override
  void initState() {
    super.initState();
    player = AudioPlayer();
  }

  @override
  void dispose() {
    player.stop();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // รับค่าจาก arguments
    final Map arguments = ModalRoute.of(context)?.settings.arguments as Map;
    // final double screenHeight=MediaQuery.of(context).size.height;
    // final double screenWidth=MediaQuery.of(context).size.width;

    return Scaffold(
      body: Column(
        children: [
          AppBar(
            leading: IconButton(
              icon: Icon(
                Icons.arrow_back,
              ),
              color: Colors.white,
              onPressed: () {
                Navigator.of(context).pop();
                player.stop();
              },
            ),
            actions: [
              IconButton(
                icon: Icon(
                  Icons.search,
                ),
                color: Colors.white,
                onPressed: () {},
              )
            ],
            backgroundColor: Colors.transparent,
            elevation: 0.0,
          ),
          SizedBox(
            height: 30,
          ),
          Container(
            width: MediaQuery.of(context).size.width * 0.8,
            height: MediaQuery.of(context).size.height * 0.4,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                // shape: BoxShape.circle,
                // border: Border.all(color: Colors.white, width: 200),
                image: DecorationImage(
                    // image:AssetImage('assets/images/song_cover.jpg'),
                    image: NetworkImage(arguments['coverurl'].toString()),
                    fit: BoxFit.cover)),
          ),
          SizedBox(height: 30),
          Text(
            arguments['albumname'].toString(),
            style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                fontFamily: "Avenir"),
          ),
          SizedBox(height: 10),
          Text(
            arguments['singername'].toString(),
            style: TextStyle(
              fontSize: 16,
            ),
          ),
          SizedBox(height: 20),
          // AudioFile(player: player, audioPath: 'https://www.soundhelix.com/examples/mp3/SoundHelix-Song-13.mp3',),
          AudioFile(
            player: player,
            audioPath: arguments['songurl'].toString(),
          ),
        ],
      ),
    );
  }
}
