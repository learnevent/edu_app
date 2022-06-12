import 'package:chewie/chewie.dart';
import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';

class ChewieItem extends StatefulWidget {
  final VideoPlayerController videoPlayerController;
  final double aspectRatio;
  final bool looping;

  const ChewieItem({
    // This will contain the URL/asset path
    required this.videoPlayerController,
    this.looping = false,
    // Smartphone Aspect ratio (vertical) 9:16 | Widescreen 16:10
    this.aspectRatio = 9 / 16,
    Key? key,
  }) : super(key: key);

  @override
  _ChewieState createState() => _ChewieState();
}

class _ChewieState extends State<ChewieItem> {
  late ChewieController _chewieController;

  @override
  void initState() {
    super.initState();

    _chewieController = ChewieController(
        videoPlayerController: widget.videoPlayerController,
        aspectRatio: widget.aspectRatio,
        looping: widget.looping,
        // Prepare the video to be played and displayed
        autoInitialize: true,
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

  @override
  void dispose() {
    super.dispose();
    widget.videoPlayerController.dispose();
    _chewieController.dispose();
  }
}
