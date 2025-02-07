import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:wave_flutter/app/models/dto/home_section.dart';
import 'package:wave_flutter/app/models/entities/album.dart';
import 'package:wave_flutter/app/models/entities/song.dart';
import 'package:wave_flutter/app/models/enums/genres.dart';

class AlbumService {
  static const String baseUrl = 'http://localhost:3000/albums';

  Future<Album> create(Album album) async {
    final response = await http.post(
      Uri.parse(baseUrl),
      headers: {'Content-Type': 'application/json'},
      body: jsonEncode(album.toJson()),
    );

    if (response.statusCode != 201) {
      throw Exception('Falha ao criar álbum');
    }

    return Album.fromJson(jsonDecode(response.body));
  }

  Future<List<Album>> find() async {
    final response = await http.get(Uri.parse(baseUrl));

    if (response.statusCode != 200) {
      throw Exception('Falha ao carregar álbuns');
    }

    return List<Album>.from(
        jsonDecode(response.body).map((model) => Album.fromJson(model)));
  }

  Future<Album> getById(String albumId) async {
    final response = await http.get(Uri.parse('$baseUrl/$albumId'));

    if (response.statusCode != 200) {
      throw Exception('Álbum não encontrado');
    }

    return Album.fromJson(jsonDecode(response.body));
  }

  Future<Album> update(String albumId, Album album) async {
    final response = await http.put(
      Uri.parse('$baseUrl/$albumId'),
      headers: {'Content-Type': 'application/json'},
      body: jsonEncode(album.toJson()),
    );

    if (response.statusCode != 200) {
      throw Exception('Falha ao atualizar álbum');
    }

    return Album.fromJson(jsonDecode(response.body));
  }

  Future<void> delete(String albumId) async {
    final response = await http.delete(Uri.parse('$baseUrl/$albumId'));

    if (response.statusCode != 200) {
      throw Exception('Falha ao deletar álbum');
    }
  }

  Future<List<HomeSectionDTO>> getTrendings(GenresEnum genre) async {
    final response = await http.get(Uri.parse('$baseUrl/trendings'));

    if (response.statusCode != 200) {
      throw Exception('Falha ao carregar tendências');
    }

    return List<HomeSectionDTO>.from(jsonDecode(response.body)
        .map((model) => HomeSectionDTO.fromJson(model)));
  }

  Future<List<Song>> getSongs(
      {int page = 1, int limit = 15, String? title}) async {
    String url = title != null
        ? '$baseUrl/songs?page=$page&limit=$limit&title=$title'
        : '$baseUrl/songs?page=$page&limit=$limit';
    final response = await http.get(Uri.parse(url));

    if (response.statusCode != 200) {
      throw Exception('Falha ao carregar tendências');
    }

    return List<Song>.from(
        jsonDecode(response.body).map((model) => Song.fromJson(model)));
  }

  Future<List<Album>> getByGenre(GenresEnum genre) async {
    final albums = await find();
    if (genre == GenresEnum.ALL) return albums;
    return albums.where((album) {
      return album.genres.any((albumGenre) =>
          albumGenre.name.toLowerCase() == genre.label.toLowerCase());
    }).toList();
  }

  Future<List<Map<String, String>>> getTrendingGenres() async {
    var a = GenresEnum.values
        .map((category) => {"label": category.label, "value": category.name})
        .toList();

    print(a);
    return a;
  }
}
