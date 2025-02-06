// import 'dart:convert';
// import 'dart:math';

// import 'package:flutter/services.dart';
// import 'package:wave_flutter/app/models/dto/home_section.dart';
// import 'package:wave_flutter/app/models/entities/album.dart';
// import 'package:wave_flutter/app/models/entities/song.dart';
// import 'package:wave_flutter/app/models/enums/genres.dart';

// class AlbumService {
//   List<Album> _DATA = [];

//   Future<void> _init() async {
//     final String jsonString = await rootBundle.loadString('assets/albums.json');
//     Map<String, dynamic> albumMap = jsonDecode(jsonString);
//     _DATA = (albumMap['albums'] as List)
//         .map((albumJson) => Album.fromJson(albumJson))
//         .toList();
//   }

//   Future<List<Album>> get() async {
//     await _init();
//     return _DATA;
//   }

//   Future<List<Song>> getSongs({int page = 1, int limit = 15}) async {
//     await _init();

//     List<Song> songs =
//         _DATA.map((album) => album.songs).expand((element) => element).toList();

//     int startIndex = (page - 1) * limit;
//     int endIndex = startIndex + limit;

//     if (page * limit > songs.length) {
//       return [];
//     }

//     return songs.sublist(
//         startIndex, endIndex > songs.length ? songs.length : endIndex);
//   }

//   Future<Album> getById(final String id) async {
//     await _init();
//     return _DATA.firstWhere((album) => album.albumId == id);
//   }

//   Future<List<Album>> getRecentlyListened() async {
//     await _init();

//     List<Album> shuffledData = List.from(_DATA);
//     shuffledData.shuffle(Random());
//     return shuffledData.take(8).toList();
//   }

//   Future<List<HomeSectionDTO>> getHomeInfo(GenresEnum genre) async {
//     List<HomeSectionDTO> sections = [];
//     List<Album> shuffledData = await getByGenre(genre);

//     List<String> titles = [
//       "Álbuns Mais Ouvidos",
//       "Novidades da Semana",
//       "Lançamentos Recentes",
//       "Top 10 Favoritos",
//       "Sugestões Baseadas no Seu Gosto",
//       "Em Alta",
//       "Músicas Recomendadas",
//       "Álbuns Clássicos"
//     ];

//     for (int i = 0; i < titles.length; i++) {
//       shuffledData.shuffle(Random());
//       sections.add(
//           HomeSectionDTO(title: titles[i], albums: List.from(shuffledData)));
//     }

//     return sections;
//   }

//   Future<List<Album>> getByGenre(GenresEnum genre) async {
//     await _init();

//     if (genre == GenresEnum.ALL) return _DATA;

//     return _DATA.where((album) {
//       return album.genres.any((albumGenre) =>
//           albumGenre.name.toLowerCase() == genre.label.toLowerCase());
//     }).toList();
//   }

//   Future<List<Map<String, String>>> getGenres() async {
//     return GenresEnum.values
//         .map((category) => {"label": category.label, "value": category.name})
//         .toList();
//   }

//   List<Song> filterSongsByQuery(List<Song> songs, String query) {
//     return songs.where((song) {
//       return song.title.toLowerCase().contains(query) ||
//           song.artists[0].name.toLowerCase().contains(query);
//     }).toList();
//   }
// }

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

    if (response.statusCode == 201) {
      return Album.fromJson(jsonDecode(response.body));
    } else {
      throw Exception('Falha ao criar álbum');
    }
  }

  Future<List<Album>> find() async {
    final response = await http.get(Uri.parse(baseUrl));

    if (response.statusCode == 200) {
      Iterable l = jsonDecode(response.body);
      return List<Album>.from(l.map((model) => Album.fromJson(model)));
    } else {
      throw Exception('Falha ao carregar álbuns');
    }
  }

  Future<Album> getById(String albumId) async {
    final response = await http.get(Uri.parse('$baseUrl/$albumId'));

    if (response.statusCode == 200) {
      return Album.fromJson(jsonDecode(response.body));
    } else {
      throw Exception('Álbum não encontrado');
    }
  }

  Future<Album> update(String albumId, Album album) async {
    final response = await http.put(
      Uri.parse('$baseUrl/$albumId'),
      headers: {'Content-Type': 'application/json'},
      body: jsonEncode(album.toJson()),
    );

    if (response.statusCode == 200) {
      return Album.fromJson(jsonDecode(response.body));
    } else {
      throw Exception('Falha ao atualizar álbum');
    }
  }

  Future<void> delete(String albumId) async {
    final response = await http.delete(Uri.parse('$baseUrl/$albumId'));

    if (response.statusCode != 200) {
      throw Exception('Falha ao deletar álbum');
    }
  }

  Future<List<HomeSectionDTO>> getHomeInfo(GenresEnum genre) async {
    List<HomeSectionDTO> sections = [];
    final albums = await find();

    List<String> titles = [
      "Álbuns Mais Ouvidos",
      "Novidades da Semana",
      "Lançamentos Recentes",
      "Top 10 Favoritos",
      "Sugestões Baseadas no Seu Gosto",
      "Em Alta",
      "Músicas Recomendadas",
      "Álbuns Clássicos"
    ];

    for (int i = 0; i < titles.length; i++) {
      sections.add(HomeSectionDTO(title: titles[i], albums: albums));
    }

    return sections;
  }

  Future<List<Album>> getByGenre(GenresEnum genre) async {
    final albums = await find();
    if (genre == GenresEnum.ALL) return albums;
    return albums.where((album) {
      return album.genres.any((albumGenre) =>
          albumGenre.name.toLowerCase() == genre.label.toLowerCase());
    }).toList();
  }

  Future<List<Song>> getSongs({int page = 1, int limit = 15}) async {
    return [];
  }

  Future<List<Map<String, String>>> getGenres() async {
    return GenresEnum.values
        .map((category) => {"label": category.label, "value": category.name})
        .toList();
  }
}
