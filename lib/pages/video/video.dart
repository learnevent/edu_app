import 'package:flutter/material.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class VideoPage extends HookConsumerWidget {
  const VideoPage({Key? key, required this.keyword}) : super(key: key);
  final String keyword;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text('Video'),
      ),
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            children: [Text(keyword)],
          ),
        ),
      ),
    );
  }
}
