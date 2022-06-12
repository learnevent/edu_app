import 'package:edu_app/pages/video_player/chewie_item.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';

class ChewieVideo extends StatelessWidget {
  const ChewieVideo({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(
          title: const Text('Chewie Player'),
        ),
        body: ChewieItem(
          videoPlayerController:
              VideoPlayerController.asset('assets/video_hd.mp4'),
          // VideoPlayerController.network('url'),
          looping: true,
        ),
      );
}
