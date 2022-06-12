import 'package:chewie/chewie.dart';
import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';

class VideoItem extends StatefulWidget {
  final VideoPlayerController videoPlayerController;
  final double aspectRatio;
  final bool looping;

  const VideoItem({
    // This will contain the URL/asset path
    required this.videoPlayerController,
    // Smartphone Aspect ratio (vertical) 9:16 | Widescreen 16:10
    this.aspectRatio = 9 / 16,
    this.looping = false,
    Key? key,
  }) : super(key: key);

  @override
  _VideoState createState() => _VideoState();
}

class _VideoState extends State<VideoItem> {
  late ChewieController _chewieController;

  @override
  void initState() {
    super.initState();

    widget.videoPlayerController.addListener(() => checkVideo);

    _chewieController = ChewieController(
        videoPlayerController: widget.videoPlayerController,
        aspectRatio: widget.aspectRatio,
        looping: widget.looping,
        // Prepare the video to be played and displayed
        autoInitialize: true,
        // ? Decide whether we need autoplay
        autoPlay: true,
        errorBuilder: (context, errorMessage) {
          return Center(
            child: Text(
              errorMessage,
              style: const TextStyle(color: Colors.white),
            ),
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Chewie(controller: _chewieController),
    );
  }

  void checkVideo(context) {
    // Implement your calls inside these conditions' bodies :
    if (widget.videoPlayerController.value.position ==
        const Duration(seconds: 0, minutes: 0, hours: 0)) {
      print('video Started');
    }

    if (widget.videoPlayerController.value.position ==
        widget.videoPlayerController.value.duration) {
      print('video Ended');
      // TODO: Add Navigator route to home
    }
  }

  @override
  void dispose() {
    super.dispose();
    widget.videoPlayerController.dispose();
    _chewieController.dispose();
  }
}
