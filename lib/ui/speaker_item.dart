import 'package:flutter/material.dart';
import 'package:flutterconflatam_accesibility/models/speaker.dart';

class SpeakerItem extends StatelessWidget {
  const SpeakerItem({
    super.key,
    required this.speaker,
    required this.onTap,
    required this.onFavoriteTap,
    required this.isFavorite,
  });

  final Speaker speaker;
  final VoidCallback onTap;
  final VoidCallback onFavoriteTap;
  final bool isFavorite;

  @override
  Widget build(BuildContext context) {
    final label = isFavorite ? 'Activado' : 'Desactivado';

    // TODO(a11y): Show speaker name as accesibility label for the item.
    return Semantics(
      label: speaker.name,
      child: _SpeakerListTile(
        onTap: onTap,
        speaker: speaker,
        onFavoriteTap: onFavoriteTap,
        isFavorite: isFavorite,
        label: label,
      ),
    );
  }
}

class _SpeakerListTile extends StatelessWidget {
  const _SpeakerListTile({
    super.key,
    required this.onTap,
    required this.speaker,
    required this.onFavoriteTap,
    required this.isFavorite,
    required this.label,
  });

  final VoidCallback onTap;
  final Speaker speaker;
  final VoidCallback onFavoriteTap;
  final bool isFavorite;
  final String label;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Card(
        color: Colors.white,
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: Row(
                  children: [
                    // TODO(a11y) : Exclude flag emoji from the accesibility
                    ExcludeSemantics(
                      child: Text(
                        speaker.flagEmoji,
                        style: const TextStyle(fontSize: 30),
                      ),
                    ),
                    const SizedBox(width: 8),
                    Expanded(
                      child: Text(
                        speaker.name,
                        semanticsLabel: '${speaker.name} - ${speaker.country}',
                        overflow: TextOverflow.ellipsis,
                        style: const TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(width: 8),
              IconButton.outlined(
                onPressed: onFavoriteTap,
                icon: SizedBox.square(
                  dimension: 48,
                  child: Icon(
                    isFavorite
                        ? Icons.favorite
                        : Icons.favorite_border_outlined,
                    semanticLabel: 'Boton favorito $label',
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
