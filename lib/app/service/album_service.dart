import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:wave_flutter/app/models/dto/home_section.dart';
import 'package:wave_flutter/app/models/entities/album.dart';
import 'package:wave_flutter/app/models/entities/genre.dart';
import 'package:wave_flutter/app/models/entities/song.dart';

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

  Future<List<Album>> find(Genre? genre) async {
    final response = genre == null
        ? await http.get(Uri.parse(baseUrl))
        : await http.get(Uri.parse('$baseUrl?genreId=${genre.genreId}'));

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

  Future<List<HomeSectionDTO>> getTrendings(Genre? genre) async {
    final response = genre == null
        ? await http.get(Uri.parse('$baseUrl/trending-albums'))
        : await http.get(
            Uri.parse('$baseUrl/trending-albums?genreId=${genre.genreId}'));

    if (response.statusCode != 200) {
      throw Exception('Falha ao carregar tendências');
    }

    return List<HomeSectionDTO>.from(jsonDecode(response.body)
        .map((model) => HomeSectionDTO.fromJson(model)));
  }

  Future<List<Song>> getSongs(
      {int page = 1, int limit = 15, String? title}) async {
    final queryParameters = {
      'page': page.toString(),
      'limit': limit.toString(),
      if (title != null) 'title': title,
    };

    final uri =
        Uri.parse('$baseUrl/songs').replace(queryParameters: queryParameters);
    final response = await http.get(uri);

    if (response.statusCode != 200) {
      throw Exception('Falha ao carregar tendências');
    }

    final List<dynamic> jsonList = jsonDecode(response.body);
    return jsonList.map((json) => Song.fromJson(json)).toList();
  }

  Future<List<Genre>> getTrendingGenres() async {
    final uri = Uri.parse('$baseUrl/trending-genres');
    final response = await http.get(uri);

    if (response.statusCode != 200) {
      throw Exception('Falha ao carregar tendências');
    }

    final List<dynamic> jsonList = jsonDecode(response.body);
    return jsonList.map((json) => Genre.fromJson(json)).toList();
  }
}
