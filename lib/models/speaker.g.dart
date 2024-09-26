// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'speaker.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Speaker _$SpeakerFromJson(Map<String, dynamic> json) => Speaker(
      name: json['name'] as String,
      position: json['position'] as String,
      company: json['company'] as String,
      country: json['country'] as String,
      flagEmoji: json['flag_emoji'] as String,
    );

Map<String, dynamic> _$SpeakerToJson(Speaker instance) => <String, dynamic>{
      'name': instance.name,
      'position': instance.position,
      'company': instance.company,
      'country': instance.country,
      'flag_emoji': instance.flagEmoji,
    };
