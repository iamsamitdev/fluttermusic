import 'package:flutter/material.dart';
import 'package:audioplayers/audioplayers.dart';

class AudioFile extends StatefulWidget {

  final AudioPlayer player;
  final String audioPath;
  const AudioFile({Key? key, required this.player, required this.audioPath}) : super(key: key);
  
  @override
  State<AudioFile> createState() => _AudioFileState();
}

class _AudioFileState extends State<AudioFile> {
  @override
  Widget build(BuildContext context) {
    return Container();
  }
}