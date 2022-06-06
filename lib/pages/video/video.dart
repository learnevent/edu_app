import 'package:flutter/material.dart';

class VideoPage extends StatelessWidget {
  const VideoPage({Key? key, required this.keyword}) : super(key: key);
  final String keyword;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text('video player'),
      ),
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Text(
                'Keyword: $keyword',
                style: const TextStyle(fontSize: 25),
                textAlign: TextAlign.left,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
