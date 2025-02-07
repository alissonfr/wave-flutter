// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'home_section.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

HomeSectionDTO _$HomeSectionDTOFromJson(Map<String, dynamic> json) =>
    HomeSectionDTO(
      title: json['title'] as String,
      albums: (json['albums'] as List<dynamic>)
          .map((e) => Album.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$HomeSectionDTOToJson(HomeSectionDTO instance) =>
    <String, dynamic>{
      'title': instance.title,
      'albums': instance.albums,
    };
