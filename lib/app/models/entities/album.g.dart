// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'album.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Album _$AlbumFromJson(Map<String, dynamic> json) => Album(
      albumId: json['albumId'] as String,
      title: json['title'] as String,
      artists: (json['artists'] as List<dynamic>)
          .map((e) => Artist.fromJson(e as Map<String, dynamic>))
          .toList(),
      genres: (json['genres'] as List<dynamic>)
          .map((e) => Genre.fromJson(e as Map<String, dynamic>))
          .toList(),
      images: AlbumImage.fromJson(json['images'] as Map<String, dynamic>),
      songs: (json['songs'] as List<dynamic>)
          .map((e) => Song.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$AlbumToJson(Album instance) => <String, dynamic>{
      'albumId': instance.albumId,
      'title': instance.title,
      'artists': instance.artists,
      'genres': instance.genres,
      'images': instance.images,
      'songs': instance.songs,
    };

AlbumImage _$AlbumImageFromJson(Map<String, dynamic> json) => AlbumImage(
      highQuality: json['highQuality'] as String,
      lowQuality: json['lowQuality'] as String,
    );

Map<String, dynamic> _$AlbumImageToJson(AlbumImage instance) =>
    <String, dynamic>{
      'highQuality': instance.highQuality,
      'lowQuality': instance.lowQuality,
    };
