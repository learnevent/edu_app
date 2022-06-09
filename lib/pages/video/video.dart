import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';
import 'video_fullscreen.dart';

class VideoPage extends StatefulWidget {
  const VideoPage({Key? key}) : super(key: key);

  @override
  State<VideoPage> createState() => _VideoPageState();
}

class _VideoPageState extends State<VideoPage> {
  late VideoPlayerController controller;
  String urlVideo = 'assets/video_hd.mp4';

  @override
  void initState() {
    super.initState();

    controller = VideoPlayerController.asset(urlVideo)
      ..addListener(() => setState(() {}))
      ..setLooping(true)
      ..initialize().then((_) => {setState(() {}), controller.play()});
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) =>
      VideoPlayerFullScreen(controller: controller);
}
