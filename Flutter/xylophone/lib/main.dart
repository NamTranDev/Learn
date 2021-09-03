import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';

void main() => runApp(MaterialApp(
        home: Scaffold(
      body: XyloPage(),
    )));

class XyloPage extends StatelessWidget {
  final AudioCache audioCache = AudioCache();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        buildKey(Colors.amber, "note1.wav"),
        buildKey(Colors.blue, "note2.wav"),
        buildKey(Colors.brown, "note3.wav"),
        buildKey(Colors.orange, "note4.wav"),
        buildKey(Colors.green, "note5.wav"),
        buildKey(Colors.grey, "note6.wav"),
        buildKey(Colors.purple, "note7.wav")
      ],
    ));
  }

  Widget buildKey(Color color, String fileName) {
    return Expanded(
        child: FlatButton(
      color: color,
      child: SizedBox(),
      onPressed: () {
        audioCache.play(fileName);
      },
    ));
  }
}
