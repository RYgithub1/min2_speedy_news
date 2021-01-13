import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';
import 'package:chewie/chewie.dart';



class HotVideoPage extends StatefulWidget {
  final VideoPlayerController videoPlayerController;
  final bool looping;

  HotVideoPage({
    Key key,
    @required this.videoPlayerController,
    this.looping,
  }) : super(key: key);

  @override
  _HotVideoPageState createState() => _HotVideoPageState();
}



class _HotVideoPageState extends State<HotVideoPage> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(title: Text("HOT VIDEO"), centerTitle: true),
        body: Container(),



      ),
    );
  }
}