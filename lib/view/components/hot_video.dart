import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';
import 'package:chewie/chewie.dart';



class HotVideo extends StatefulWidget {
  final VideoPlayerController videoPlayerController;
  final bool looping;
  HotVideo({
      @required this.videoPlayerController,
      this.looping,
      Key key,
  }) : super(key: key);
  @override
  _HotVideoState createState() => _HotVideoState();
}



class _HotVideoState extends State<HotVideo> {

  ChewieController _chewieController;

  /// [========== initState() ===========]
  @override
  void initState() {     /// [Nottice: void initState({xxx})  or  void initState(){xxx}]
      super.initState();
      _chewieController = ChewieController(
          videoPlayerController: widget.videoPlayerController,
          aspectRatio: 16 / 9,
          autoInitialize: true,
          looping: widget.looping,
          errorBuilder: (context, errorMessage) {
            return Text(errorMessage, style: TextStyle(color: Colors.white));
          }
      );
  }

  /// [========== build() ===========]
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(12),
      child: Chewie(
        controller: _chewieController,
      ),
    );
  }

  /// [========== dispose() ===========]
  @override
  void dispose() {
    super.dispose();
    widget.videoPlayerController.dispose();
    _chewieController.dispose();
  }
}