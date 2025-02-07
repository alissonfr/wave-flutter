import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:http/http.dart';
import 'package:wave_flutter/app/models/entities/playlist.dart';
import 'package:wave_flutter/app/models/entities/song.dart';

class PlaylistService {
  static const String baseUrl = 'http://localhost:3001/playlists';

  Future<Playlist> create(final List<Song> songs) async {
    Playlist playlist = Playlist.simple(
      image: "assets/images/playlist.png",
      songs: songs,
    );

    final response = await http.post(
      Uri.parse(baseUrl),
      headers: {'Content-Type': 'application/json'},
      body: jsonEncode(playlist.toJson()),
    );

    if (response.statusCode == 201) {
      return Playlist.fromJson(jsonDecode(response.body));
    } else {
      throw Exception('Falha ao criar álbum');
    }
  }

  Future<List<Playlist>> find() async {
    final Response response = await http.get(Uri.parse(baseUrl));

    if (response.statusCode == 200) {
      Iterable l = jsonDecode(response.body);
      return List<Playlist>.from(l.map((model) => Playlist.fromJson(model)));
    } else {
      throw Exception('Falha ao carregar álbuns');
    }
  }

  Future<Playlist> getById(String playlistId) async {
    final response = await http.get(Uri.parse('$baseUrl/$playlistId'));

    if (response.statusCode == 200) {
      return Playlist.fromJson(jsonDecode(response.body));
    } else {
      throw Exception('Álbum não encontrado');
    }
  }

  Future<Playlist> update(String playlistId, Playlist playlist) async {
    final response = await http.put(
      Uri.parse('$baseUrl/$playlistId'),
      headers: {'Content-Type': 'application/json'},
      body: jsonEncode(playlist.toJson()),
    );

    if (response.statusCode == 200) {
      return Playlist.fromJson(jsonDecode(response.body));
    } else {
      throw Exception('Falha ao atualizar álbum');
    }
  }

  Future<void> delete(String playlistId) async {
    final response = await http.delete(Uri.parse('$baseUrl/$playlistId'));

    if (response.statusCode != 200) {
      throw Exception('Falha ao deletar álbum');
    }
  }
}
