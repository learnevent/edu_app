import 'package:flutter/material.dart';

class VideoPage extends StatelessWidget {
  const VideoPage({Key? key, required this.data}) : super(key: key);
  final String data;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(data),
      ),
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            children: const [
              Text(
                'Hello',
                style: TextStyle(fontSize: 25),
                textAlign: TextAlign.left,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
