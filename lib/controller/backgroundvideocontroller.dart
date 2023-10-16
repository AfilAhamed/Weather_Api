// import 'package:flutter/material.dart';
// import 'package:video_player/video_player.dart';

// class VideoPlayerState extends ChangeNotifier {
//   late VideoPlayerController _videoController;

//   VideoPlayerController get videoController => _videoController;

//   VideoPlayerState() {
//     _initializeVideoController();
//   }

//   void _initializeVideoController() {
//     _videoController = VideoPlayerController.asset(
//         'lib/assets/pexels-kelly-lacy-9699972 (Original).mp4')
//       ..initialize().then((_) {
//         _videoController.play();
//         _videoController.setLooping(true);
//         notifyListeners();
//       });
//   }

//   @override
//   void dispose() {
//     _videoController.dispose();
//     super.dispose();
//   }
// }
