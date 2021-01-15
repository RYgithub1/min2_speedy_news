// import 'package:flutter/material.dart';
// import 'package:video_player/video_player.dart';
// import 'package:chewie/chewie.dart';



// class HotVideoPage extends StatefulWidget {
//   final VideoPlayerController videoPlayerController;
//   final bool looping;
//   HotVideoPage({
//     @required this.videoPlayerController,
//     this.looping,
//     Key key,
//   }) : super(key: key);
//   @override
//   _HotVideoPageState createState() => _HotVideoPageState();
// }


                
// class _ChewiePubDevState extends State<ChewiePubDev> {
//   ChewieController _chewieController;

//   @override
//   void initState() {
//     super.initState();
//     // Wrapper on top of the videoPlayerController
//     _chewieController = ChewieController(
            


// class _HotVideoPageState extends State<HotVideoPage> {

//   ChewieController _chewieController;

//   @override
//   void initState({
//     super.initState() {
//       _chewieController = ChewieController(
//           videoPlayerController: widget.videoPlayerController,
//           aspectRation: 16/9,
//           autoInitialize: true,
//           looping: widget.looping,
//           errorBuilder: (context, errorMessage) {
//             return Text(errorMessage, style: TextStyle(color: Colors.white));
//           }
//       );
//     };
//   });


//   /// [========== build() ===========]
//   @override
//   Widget build(BuildContext context) {
//     return Padding(
//       padding: const EdgeInsets.all(8.0),
//       child: Chewie(
//         controller: _chewieController,
//       ),
//     );
//   }

//   @override
//   void dispose() {
//     super.dispose();
//     widget.videoPlayerController.dispose();
//     _chewieController.dispose();
//   }

// }