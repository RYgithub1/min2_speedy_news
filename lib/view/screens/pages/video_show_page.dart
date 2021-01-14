import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';
import 'package:chewie/chewie.dart';


class VideoShowPage extends StatelessWidget {
  // const VideoShowPage({Key key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("VIDEO")),
      body: ListView(
        children: <Widget>[
          ChewieListItem(
            videoPlayerController: VideoPlayerController
                .asset("assets/videos/drivingLover.mp4"),
            looping: true,
          ),
          ChewieListItem(
            videoPlayerController: VideoPlayerController
                .asset("assets/videos/fireworksMaestro.mp4"),
            looping: true,
          ),
        ],
      ),
    );
  }
}