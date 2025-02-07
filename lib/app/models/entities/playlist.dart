import 'package:json_annotation/json_annotation.dart';
import 'package:wave_flutter/app/models/entities/song.dart';

part 'playlist.g.dart';

@JsonSerializable()
class Playlist {
  final String playlistId;
  final String title;
  final String image;
  List<Song> songs;

  Playlist({
    required this.playlistId,
    required this.title,
    required this.image,
    required this.songs,
  });

  Playlist.simple({
    required this.image,
    required this.songs,
  })  : playlistId = '',
        title = '';

  factory Playlist.fromJson(Map<String, dynamic> json) =>
      _$PlaylistFromJson(json);
  Map<String, dynamic> toJson() => _$PlaylistToJson(this);
}
