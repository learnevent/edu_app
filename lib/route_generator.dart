import 'package:flutter/material.dart';
import 'package:edu_app/main.dart';
import 'package:edu_app/pages/video_player/video_player.dart';
import 'package:edu_app/pages/camera/camera.dart';
import 'package:edu_app/pages/homepage/homepage.dart';

class RouteGenerator {
  static Route<dynamic>? generateRoute(RouteSettings settings) {
    final args = settings.arguments;
    switch (settings.name) {
      case '/':
        return MaterialPageRoute(builder: (_) => HomePage());
      case '/video':
        if (args is String) {
          return MaterialPageRoute(builder: (_) => const VideoPlayer());
        }
        return _errorRoute();
      case '/camera':
        return MaterialPageRoute(
            builder: (_) => CameraApp(
                  cameras: cameras,
                ));
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
