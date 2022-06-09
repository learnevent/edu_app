import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';

class VideoPlayerFullScreen extends StatelessWidget {
  VideoPlayerController controller;
  VideoPlayerFullScreen({Key? key, required this.controller}) : super(key: key);

  @override
  Widget build(BuildContext context) => controller.value.isInitialized
      ? Container(alignment: Alignment.topCenter, child: buildVideo())
      : const Center(child: CircularProgressIndicator());

  Widget buildVideo() =>
      Stack(fit: StackFit.expand, children: <Widget>[buildVideoPlayer()]);

  Widget buildVideoPlayer() => buildFullScreen(
          child: AspectRatio(
        aspectRatio: controller.value.aspectRatio,
        child: VideoPlayer(controller),
      ));

  Widget buildFullScreen({
    required Widget child,
  }) {
    final size = controller.value.size;
    final width = size.width;
    final height = size.height;

    return FittedBox(
        fit: BoxFit.cover,
        // ? Research more about Aspect ratio
        // ? Aspect raito needs modification for different devices (The 1.06 is custom for test device)
        child: SizedBox(width: width * 1.06, height: height, child: child));
  }
}
