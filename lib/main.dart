import 'package:flutter/material.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Welcome EduApp',
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Welcome EduApp'),
        ),
        body: const Center(
          child: Text('Hello EduApp'),
        ),
      ),
    );
  }
}
