import 'package:edu_app/pages/video_player/video_item.dart';
import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';

class VideoPlayer extends StatelessWidget {
  const VideoPlayer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) => Scaffold(
      appBar: AppBar(
        title: const Text('Chewie Player'),
      ),
      body: VideoItem(
        videoPlayerController:
            VideoPlayerController.asset('assets/video_hd.mp4'),
        // TODO: provide URL to fetch video from storage
        // VideoPlayerController.network('url'),
      ));
}
