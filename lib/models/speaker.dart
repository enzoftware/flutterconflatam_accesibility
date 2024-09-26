import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'speaker.g.dart';

@JsonSerializable()
class Speaker extends Equatable {
  const Speaker({
    required this.name,
    required this.position,
    required this.company,
    required this.country,
    required this.flagEmoji,
  });

  final String name;
  final String position;
  final String company;
  final String country;

  @JsonKey(name: 'flag_emoji')
  final String flagEmoji;

  factory Speaker.fromJson(Map<String, dynamic> json) =>
      _$SpeakerFromJson(json);

  Map<String, dynamic> toJson() => _$SpeakerToJson(this);

  @override
  String toString() {
    return "$name, $position, $company, $country, $flagEmoji, ";
  }

  @override
  List<Object?> get props => [
        name,
        position,
        company,
        country,
        flagEmoji,
      ];
}
