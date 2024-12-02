import 'package:wave_flutter/app/models/entities/artist.dart';
import 'package:wave_flutter/app/models/entities/genre.dart';
import 'package:wave_flutter/app/models/entities/song.dart';
import 'package:json_annotation/json_annotation.dart';

part 'album.g.dart';

@JsonSerializable()
class Album {
  // flutter pub run build_runner build
  final String albumId;
  final String title;
  final List<Artist> artists;
  final List<Genre> genres;
  final AlbumImage images;
  final List<Song> songs;

  Album({
    required this.albumId,
    required this.title,
    required this.artists,
    required this.genres,
    required this.images,
    required this.songs,
  });

  factory Album.fromJson(Map<String, dynamic> json) => _$AlbumFromJson(json);
  Map<String, dynamic> toJson() => _$AlbumToJson(this);
}

@JsonSerializable()
class AlbumImage {
  final String highQuality;
  final String lowQuality;

  AlbumImage({
    required this.highQuality,
    required this.lowQuality,
  });

  factory AlbumImage.fromJson(Map<String, dynamic> json) =>
      _$AlbumImageFromJson(json);
  Map<String, dynamic> toJson() => _$AlbumImageToJson(this);
}
