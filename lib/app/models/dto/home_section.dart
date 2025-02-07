import 'package:wave_flutter/app/models/entities/album.dart';
import 'package:json_annotation/json_annotation.dart';

part 'home_section.g.dart';

@JsonSerializable()
class HomeSectionDTO {
  final String title;
  final List<Album> albums;

  HomeSectionDTO({
    required this.title,
    required this.albums,
  });

  factory HomeSectionDTO.fromJson(Map<String, dynamic> json) =>
      _$HomeSectionDTOFromJson(json);
  Map<String, dynamic> toJson() => _$HomeSectionDTOToJson(this);
}
