import 'package:flutter/material.dart';
import 'package:flutterconflatam_accesibility/models/speaker.dart';

class SpeakerDetailView extends StatelessWidget {
  const SpeakerDetailView({super.key, required this.speaker});

  final Speaker speaker;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(speaker.name),
        Text(speaker.country),
        Text(speaker.position),
        Text(speaker.company),
      ],
    );
  }
}
