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
              placeholder: (context, url) => const Center(
                child: CircularProgressIndicator(),
              ),
              errorWidget: (context, url, error) => const Icon(Icons.error),
            ),
          ),
        ),
        SpeakerDetailItem(title: 'Nombre', text: speaker.name),
        SpeakerDetailItem(title: 'Pais', text: speaker.country),
        SpeakerDetailItem(title: 'Rol', text: speaker.position),
        ExcludeSemantics(
          excluding: speaker.company.isEmpty,
          child: SpeakerDetailItem(title: 'Compañia', text: speaker.company),
        ),
      ],
    );
  }
}

class SpeakerDetailItem extends StatelessWidget {
  const SpeakerDetailItem({super.key, required this.title, required this.text});

  final String title;
  final String text;

  @override
  Widget build(BuildContext context) {
    return MergeSemantics(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            title,
            style: const TextStyle(fontWeight: FontWeight.bold),
          ),
          const SizedBox(width: 8),
          Flexible(
            child: Text(
              text,
              overflow: TextOverflow.ellipsis,
            ),
          ),
        ],
      ),
    );
  }
}
