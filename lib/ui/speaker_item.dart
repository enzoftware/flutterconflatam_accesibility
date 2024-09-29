import 'package:flutter/material.dart';
import 'package:flutterconflatam_accesibility/models/speaker.dart';

class SpeakerItem extends StatelessWidget {
  const SpeakerItem({super.key, required this.speaker, required this.onTap});

  final Speaker speaker;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Card(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              speaker.name,
              style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            Text(
              speaker.flagEmoji,
              style: const TextStyle(fontSize: 30),
            ),
          ],
        ),
      ),
    );
  }
}
