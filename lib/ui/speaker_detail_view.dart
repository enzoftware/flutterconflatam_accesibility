import 'package:cached_network_image/cached_network_image.dart';
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
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 8.0),
          child: Semantics(
            label: 'Imagen de perfil de ${speaker.name}',
            child: CachedNetworkImage(
              imageUrl: speaker.picture,
              placeholder: (context, url) => const CircularProgressIndicator(),
              errorWidget: (context, url, error) => const Icon(Icons.error),
            ),
          ),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Text('Nombre:'),
            const SizedBox(width: 8),
            Text(speaker.name),
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Text('Pais'),
            const SizedBox(width: 8),
            Text(speaker.country),
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Text('Rol'),
            const SizedBox(width: 8),
            Flexible(
              child: Text(
                speaker.position,
                overflow: TextOverflow.ellipsis,
              ),
            ),
          ],
        ),
        ExcludeSemantics(
          excluding: speaker.company.isEmpty,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text('Compañia'),
              const SizedBox(width: 8),
              Text(speaker.company),
            ],
          ),
        ),
      ],
    );
  }
}
