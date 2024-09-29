import 'package:flutter/material.dart';
import 'package:flutterconflatam_accesibility/data/speakers_repository.dart';
import 'package:flutterconflatam_accesibility/ui/speakers_list_view.dart';

void main() {
  final repository = SpeakersRepository();
  runApp(FlutterConfLatamApp(speakersRepository: repository));
}

class FlutterConfLatamApp extends StatelessWidget {
  const FlutterConfLatamApp({super.key, required this.speakersRepository});

  final SpeakersRepository speakersRepository;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'FlutterConfLatam',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: const Text('FlutterConf Latam 2024'),
        ),
        body: SpeakersListView(repository: speakersRepository),
      ),
    );
  }
}
