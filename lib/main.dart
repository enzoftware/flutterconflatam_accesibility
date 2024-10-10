import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutterconflatam_accesibility/data/speakers_repository.dart';
import 'package:flutterconflatam_accesibility/ui/bloc/speakers_bloc.dart';
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
    return BlocProvider(
      create: (context) =>
          SpeakersBloc(speakersRepository)..add(const FetchSpeakers()),
      child: MaterialApp(
        title: 'FlutterConfLatam',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.lightBlue),
          useMaterial3: true,
        ),
        home: SpeakersView(speakersRepository: speakersRepository),
      ),
    );
  }
}
