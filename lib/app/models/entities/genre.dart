import 'package:json_annotation/json_annotation.dart';

part 'genre.g.dart';

@JsonSerializable()
class Genre {
  final String genreId;
  final String name;

  Genre({
    required this.genreId,
    required this.name,
  });

  Genre.simple({
    required this.name,
  }) : genreId = '';

  factory Genre.fromJson(Map<String, dynamic> json) => _$GenreFromJson(json);
  Map<String, dynamic> toJson() => _$GenreToJson(this);
}
