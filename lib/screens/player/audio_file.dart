import 'package:flutter/material.dart';
import 'package:audioplayers/audioplayers.dart';

class AudioFile extends StatefulWidget {
  final AudioPlayer player;
  final String audioPath;
  const AudioFile({Key? key, required this.player, required this.audioPath})
      : super(key: key);

  @override
  State<AudioFile> createState() => _AudioFileState();
}

class _AudioFileState extends State<AudioFile> {
  // ส่วนของการคำนวณระยะเวลาของเพลง
  Duration _duration = new Duration();
  Duration _position = new Duration();
  // bool isPlaying=false;
  bool isPlaying = true;
  bool isPaused = false;
  bool isRepeat = false;
  Color color = Colors.white;
  List<IconData> _icons = [
    Icons.play_arrow,
    Icons.pause,
  ];

  // สร้างฟังก์ชันสำหรับกำหนดค่าเริ่มต้นของตัว player
  @override
  void initState() {
    super.initState();

    // Play Auto When Will Appear----------------------
    this.widget.player.play(this.widget.audioPath);
    // ------------------------------------------------

    this.widget.player.onDurationChanged.listen((d) {
      setState(() {
        _duration = d;
      });
    });
    this.widget.player.onAudioPositionChanged.listen((p) {
      setState(() {
        _position = p;
      });
    });

    this.widget.player.setUrl(this.widget.audioPath);
    this.widget.player.onPlayerCompletion.listen((event) {
      setState(() {
        _position = Duration(seconds: 0);
        if (isRepeat == true) {
          isPlaying = true;
        } else {
          isPlaying = false;
          isRepeat = false;
        }
      });
    });
  }

  // สร้างฟังก์ชัน Play
  Widget btnStart() {
    return Container(
      width: 80,
      height: 80,
      // color: Colors.white,
      decoration: BoxDecoration(
        color: Color.fromRGBO(38, 38, 38, 0.6),
        shape: BoxShape.circle,
      ),
      child: IconButton(
        icon: isPlaying == false
            ? Icon(_icons[0], size: 50, color: Colors.white)
            : Icon(_icons[1], size: 50, color: Colors.white),
        splashColor: Colors.white,
        onPressed: () {
          if (isPlaying == false) {
            this.widget.player.play(this.widget.audioPath);
            setState(() {
              isPlaying = true;
            });
          } else if (isPlaying == true) {
            this.widget.player.pause();
            setState(() {
              isPlaying = false;
            });
          }
        },
      ),
    );
  }

  // สร้างฟังก์ชันเพิ่มความเร็วการเล่น PlaybackRate
  Widget btnFast() {
    return Container(
      child: IconButton(
        icon: Icon(Icons.skip_next),
        color: Colors.white,
        iconSize: 40,
        onPressed: () {
          this.widget.player.setPlaybackRate(1.5);
        },
      ),
    );
  }

  // สร้างฟังก์ชันลดความเร็วการเล่น PlaybackRate
  Widget btnSlow() {
    return Container(
      child: IconButton(
        icon: Icon(Icons.skip_previous),
        color: Colors.white,
        iconSize: 40,
        onPressed: () {
          this.widget.player.setPlaybackRate(0.5);
        },
      ),
    );
  }

  // สร้างฟังก์ชัน Repeat
  Widget btnRepeat() {
    return Container(
      child: IconButton(
        icon: Icon(Icons.repeat_rounded),
        color: Colors.white,
        iconSize: 30,
        onPressed: () {
          if (isRepeat == false) {
            this.widget.player.setReleaseMode(ReleaseMode.LOOP);
            setState(() {
              isRepeat = true;
              color = Colors.blue;
            });
          } else if (isRepeat == true) {
            this.widget.player.setReleaseMode(ReleaseMode.RELEASE);
            color = Colors.black;
            isRepeat = false;
          }
        },
      ),
    );
  }

  // สร้างฟังก์ชัน random
  Widget btnRandom() {
    return Container(
      child: IconButton(
        icon: Icon(Icons.shuffle),
        color: Colors.white,
        iconSize: 30,
        onPressed: () {},
      ),
    );
  }

  // สร้างฟังก์ชัน slider
  Widget slider() {
    return SizedBox(
      height: 25,
      child: Slider(
          activeColor: Colors.red,
          inactiveColor: Colors.grey,
          value: _position.inSeconds.toDouble(),
          min: 0.0,
          max: _duration.inSeconds.toDouble(),
          onChanged: (double value) {
            setState(() {
              changeToSecond(value.toInt());
              value = value;
            });
          }),
    );
  }

  // สร้างฟังก์ชันเปลี่ยนไปตำแหน่งต่างๆ
  void changeToSecond(int second) {
    Duration newDuration = Duration(seconds: second);
    this.widget.player.seek(newDuration);
  }

  // สร้างฟังก์ชันรวม Widget ทั้งหมดที่สร้างไว้
  Widget loadAsset() {
    return Container(
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [btnRandom(), btnSlow(), btnStart(), btnFast(), btnRepeat()],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          slider(),
          Padding(
            padding: const EdgeInsets.only(left: 25, right: 25),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  _position.toString().split(".")[0],
                  style: TextStyle(fontSize: 14),
                ),
                Text(
                  _duration.toString().split(".")[0],
                  style: TextStyle(fontSize: 14),
                ),
              ],
            ),
          ),
          loadAsset()
        ],
      ),
    );
  }
}
