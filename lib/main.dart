import 'package:flutter/material.dart';
import 'package:edu_app/utils/colors.dart';
import 'package:edu_app/route_generator.dart';

void main() {
  runApp(
    const MyApp(),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Learn Event',
      theme:
          ThemeData.dark().copyWith(scaffoldBackgroundColor: backgroundColor),
      onGenerateRoute: (RouteSettings settings) =>
          RouteGenerator.generateRoute(settings),
    );
  }
}
