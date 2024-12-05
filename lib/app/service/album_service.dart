import 'dart:convert';
import 'dart:math';

import 'package:flutter/services.dart';
import 'package:wave_flutter/app/models/dto/home_section.dart';
import 'package:wave_flutter/app/models/entities/album.dart';
import 'package:wave_flutter/app/models/enums/genres.dart';

class AlbumService {
  List<Album> _DATA = [];

  Future<void> _init() async {
    final String jsonString = await rootBundle.loadString('assets/albums.json');
    Map<String, dynamic> albumMap = jsonDecode(jsonString);
    _DATA = (albumMap['albums'] as List)
        .map((albumJson) => Album.fromJson(albumJson))
        .toList();
  }

  Future<List<Album>> get() async {
    await _init();
    return _DATA;
  }

  Future<Album> getById(final String id) async {
    await _init();
    return _DATA.firstWhere((album) => album.albumId == id);
  }

  Future<List<Album>> getRecentlyListened() async {
    await _init();

    List<Album> shuffledData = List.from(_DATA);
    shuffledData.shuffle(Random());
    return shuffledData.take(8).toList();
  }

  Future<List<HomeSectionDTO>> getHomeInfo(GenresEnum genre) async {
    List<HomeSectionDTO> sections = [];
    List<Album> shuffledData = await getByGenre(genre);

    List<String> titles = [
      "Álbuns Mais Ouvidos",
      "Novidades da Semana",
      "Lançamentos Recentes",
      "Top 10 Favoritos",
      "Sugestões Baseadas no Seu Gosto",
      "Em Alta",
      "Músicas Recomendadas",
      "Álbuns Clássicos",
      "Hits do Momento"
    ];

    for (int i = 0; i < titles.length; i++) {
      shuffledData.shuffle(Random());
      sections.add(
          HomeSectionDTO(title: titles[i], albums: List.from(shuffledData)));
    }

    return sections;
  }

  Future<List<Album>> getByGenre(GenresEnum genre) async {
    await _init();

    if (genre == GenresEnum.ALL) return _DATA;

    return _DATA.where((album) {
      return album.genres.any((albumGenre) =>
          albumGenre.name.toLowerCase() == genre.label.toLowerCase());
    }).toList();
  }

  Future<List<Map<String, String>>> getGenres() async {
    return GenresEnum.values
        .map((category) => {"label": category.label, "value": category.name})
        .toList();
  }
}
