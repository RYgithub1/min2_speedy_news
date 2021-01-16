import 'package:flutter/material.dart';
import 'package:min2_speedy_news/view/components/hot_video.dart';
import 'package:video_player/video_player.dart';



class VideoShowPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("VIDEO")),
      body: ListView(
        children: <Widget>[
          HotVideo(
            videoPlayerController: VideoPlayerController.asset(
                  "assets/videos/drivingLover.mp4"),
            looping: true,
          ),
          HotVideo(
            videoPlayerController: VideoPlayerController
                .asset("assets/videos/fireworksMaestro.mp4"),
            looping: false,
          ),
          HotVideo(
            videoPlayerController: VideoPlayerController
                .network("http://www.sample-videos.com/video123/mp4/720/big_buck_bunny_720p_20mb.mp4"),
            looping: true,
          ),
        ],
      ),
    );
  }
}
