import 'package:flutter/material.dart';
import 'package:flutterconflatam_accesibility/data/speakers_repository.dart';
import 'package:flutterconflatam_accesibility/ui/speaker_item.dart';

class SpeakersListView extends StatelessWidget {
  const SpeakersListView({super.key, required this.repository});

  final SpeakersRepository repository;

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: repository.fetchSpeakers(),
      builder: (context, snapshot) {
        if (!snapshot.hasData) {
          return const Center(child: CircularProgressIndicator.adaptive());
        }
        return GridView.builder(
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            mainAxisSpacing: 8.0,
            crossAxisSpacing: 8.0,
            mainAxisExtent: 150,
          ),
          shrinkWrap: true,
          itemCount: snapshot.data!.length,
          itemBuilder: (context, index) {
            final speaker = snapshot.data![index];
            return SpeakerItem(
              speaker: speaker,
              onTap: () {},
            );
          },
        );
      },
    );
  }
}
