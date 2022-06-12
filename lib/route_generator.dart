import 'package:edu_app/pages/video/video.dart';
import 'package:edu_app/pages/video_player/chewie_video.dart';
import 'package:edu_app/pages/homepage/homepage.dart';
import 'package:flutter/material.dart';

class RouteGenerator {
  static Route<dynamic>? generateRoute(RouteSettings settings) {
    final args = settings.arguments;
    switch (settings.name) {
      case '/':
        return MaterialPageRoute(builder: (_) => HomePage());
      case '/video':
        if (args is String) {
          return MaterialPageRoute(builder: (_) => const ChewieVideo());
        }
        return _errorRoute();
      default:
        return _errorRoute();
    }
  }

  static Route<dynamic> _errorRoute() {
    return MaterialPageRoute(builder: (_) {
      return Scaffold(
          appBar: AppBar(
            title: const Text('Error'),
          ),
          body: const Center(
            child: Text('Error'),
          ));
    });
  }
}
