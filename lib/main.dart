import 'package:flutter/material.dart';
import 'package:edu_app/utils/colors.dart';
import 'package:edu_app/route_generator.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

// We create a "provider", which will store a value (here "Hello world").
// By using a provider, this allows us to mock/override the value exposed.
final exampelProvider = Provider((_) => 'Hello riverpod');

void main() {
  runApp(
    // For widgets to be able to read providers, we need to wrap the entire
    // application in a "ProviderScope" widget.
    // This is where the state of our providers will be stored.
    const ProviderScope(child: MyApp()),
  );
}

// Note: MyApp is a HookConsumerWidget, from hooks_riverpod.
class MyApp extends HookConsumerWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme:
          ThemeData.dark().copyWith(scaffoldBackgroundColor: backgroundColor),
      onGenerateRoute: (RouteSettings settings) =>
          RouteGenerator.generateRoute(settings),
    );
  }
}
