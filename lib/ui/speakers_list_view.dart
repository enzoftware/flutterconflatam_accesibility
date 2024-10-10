import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutterconflatam_accesibility/data/speakers_repository.dart';
import 'package:flutterconflatam_accesibility/ui/bloc/speakers_bloc.dart';
import 'package:flutterconflatam_accesibility/ui/speaker_detail_view.dart';
import 'package:flutterconflatam_accesibility/ui/speaker_item.dart';

class SpeakersView extends StatelessWidget {
  const SpeakersView({super.key, required this.speakersRepository});

  final SpeakersRepository speakersRepository;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text('FlutterConf Latam 2024'),
      ),
      body: const SpeakersListView(),
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.schedule),
        onPressed: () {
          showModalBottomSheet(
            context: context,
            builder: (context) {
              return BlocProvider.value(
                value: context.read<SpeakersBloc>(),
                child: BlocBuilder<SpeakersBloc, SpeakersState>(
                  builder: (context, state) {
                    final scheduledSpeakers = context.select(
                      (SpeakersBloc bloc) =>
                          (bloc.state as SpeakersDataLoaded).favoriteSpeakers,
                    );
                    return Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Center(
                          child: Text(
                            'Speakers Favoritos',
                            style: TextStyle(
                              fontSize: 24,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                        const SizedBox(height: 16),
                        SizedBox(
                          height: 400,
                          child: ListView.builder(
                            itemCount: scheduledSpeakers.length,
                            itemBuilder: (context, index) {
                              final speaker = scheduledSpeakers[index];
                              return SpeakerItem(
                                speaker: speaker,
                                onTap: () {},
                                onFavoriteTap: () {},
                                isFavorite: true,
                              );
                            },
                          ),
                        ),
                      ],
                    );
                  },
                ),
              );
            },
          );
        },
      ),
    );
  }
}

class SpeakersListView extends StatelessWidget {
  const SpeakersListView({super.key});

  @override
  Widget build(BuildContext context) {
    final state = context.select((SpeakersBloc bloc) => bloc.state);
    if (state is SpeakersLoading) {
      return const Center(child: CircularProgressIndicator.adaptive());
    }
    if (state is SpeakersDataLoaded) {
      final speakers = state.fullSpeakers;
      final favorites = state.favoriteSpeakers;
      return ListView.builder(
        shrinkWrap: true,
        itemCount: speakers.length,
        itemBuilder: (context, index) {
          final speaker = speakers[index];
          final isFavorite = favorites.contains(speaker);
          return Padding(
            padding: const EdgeInsets.symmetric(vertical: 8.0),
            child: SpeakerItem(
              speaker: speaker,
              isFavorite: isFavorite,
              onFavoriteTap: () {
                context
                    .read<SpeakersBloc>()
                    .add(ToggleScheduleSpeaker(speaker: speaker));
              },
              onTap: () {
                showDialog(
                  context: context,
                  builder: (context) {
                    return AlertDialog(
                      title: const Text('Detalles speaker'),
                      content: SpeakerDetailView(speaker: speaker),
                    );
                  },
                );
              },
            ),
          );
        },
      );
    }
    return const SizedBox();
  }
}
