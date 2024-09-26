import 'package:flutter/material.dart';

void main() {
  runApp(const FlutterConfLatamApp());
}

class FlutterConfLatamApp extends StatelessWidget {
  const FlutterConfLatamApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'FlutterConfLatam',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const Placeholder(),
    );
  }
}
