import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutterconflatam_accesibility/data/speakers_repository.dart';
import 'package:flutterconflatam_accesibility/ui/bloc/speakers_bloc.dart';
import 'package:flutterconflatam_accesibility/ui/speakers_list_view.dart';

void main() {
  final repository = SpeakersRepository();
  runApp(
    BlocProvider(
      create: (context) => SpeakersBloc(repository)..add(const FetchSpeakers()),
      child: MyAccessibleFlutterConfLatamApp(
        speakersRepository: repository,
      ),
    ),
  );
}

class MyAccessibleFlutterConfLatamApp extends StatelessWidget {
  const MyAccessibleFlutterConfLatamApp({
    super.key,
    required this.speakersRepository,
  });

  final SpeakersRepository speakersRepository;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: SpeakersView(speakersRepository: speakersRepository),
    );
  }
}

class FlutterConfLatamApp extends StatelessWidget {
  const FlutterConfLatamApp({super.key, required this.speakersRepository});

  final SpeakersRepository speakersRepository;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'FlutterConfLatam',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.lightBlue),
        useMaterial3: true,
      ),
      home: SpeakersView(speakersRepository: speakersRepository),
    );
  }
}
