import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutterconflatam_accesibility/data/speakers_repository.dart';
import 'package:flutterconflatam_accesibility/models/speaker.dart';
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
        title: Semantics(
          header: true,
          sortKey: const OrdinalSortKey(0),
          child: const Text('FlutterConf Latam 2024'),
        ),
      ),
      body: Semantics(
        sortKey: const OrdinalSortKey(2),
        child: const SpeakersListView(),
      ),
      floatingActionButton: Semantics(
        sortKey: const OrdinalSortKey(1),
        button: true,
        child: FloatingActionButton(
          tooltip: 'Ver Ponentes Favoritos',
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
                      return _FavoriteSpeakersView(
                        scheduledSpeakers: scheduledSpeakers,
                      );
                    },
                  ),
                );
              },
            );
          },
        ),
      ),
    );
  }
}

class _FavoriteSpeakersView extends StatelessWidget {
  const _FavoriteSpeakersView({
    required this.scheduledSpeakers,
  });

  final List<Speaker> scheduledSpeakers;

  @override
  Widget build(BuildContext context) {
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
  }
}

class SpeakersListView extends StatelessWidget {
  const SpeakersListView({super.key});

  @override
  Widget build(BuildContext context) {
    final state = context.select((SpeakersBloc bloc) => bloc.state);

    return switch (state) {
      SpeakersLoading() => const Center(
          child: CircularProgressIndicator.adaptive(
            semanticsLabel: 'Cargando speakers',
          ),
        ),
      SpeakersDataLoaded() => SpeakerListViewDataLoaded(
          speakers: state.fullSpeakers,
          favorites: state.favoriteSpeakers,
        ),
    };
  }
}

class SpeakerListViewDataLoaded extends StatelessWidget {
  const SpeakerListViewDataLoaded({
    super.key,
    required this.speakers,
    required this.favorites,
  });

  final List<Speaker> speakers;
  final List<Speaker> favorites;

  @override
  Widget build(BuildContext context) {
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
              debugDumpSemanticsTree();
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
}
