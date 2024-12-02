import 'package:wave_flutter/app/models/entities/artist.dart';
import 'package:json_annotation/json_annotation.dart';

part 'song.g.dart';

@JsonSerializable()
class Song {
  final String songId;
  final String title;
  final List<Artist> artists;
  final String url;

  Song({
    required this.songId,
    required this.title,
    required this.artists,
    required this.url,
  });

  factory Song.fromJson(Map<String, dynamic> json) => _$SongFromJson(json);
  Map<String, dynamic> toJson() => _$SongToJson(this);
}
