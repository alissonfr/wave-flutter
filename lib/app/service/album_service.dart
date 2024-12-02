import 'dart:convert';
import 'dart:io';
import 'dart:math';

import 'package:flutter/services.dart';
import 'package:wave_flutter/app/models/dto/home_section.dart';
import 'package:wave_flutter/app/models/entities/album.dart';

class AlbumService {
  List<Album> _DATA = [];

  Future<void> _init() async {
    final String jsonString = await rootBundle.loadString('assets/music.json');
    Map<String, dynamic> albumMap = jsonDecode(jsonString);
    _DATA = (albumMap['albums'] as List)
        .map((albumJson) => Album.fromJson(albumJson))
        .toList();
  }

  Future<List<Album>> get() async {
    return _DATA;
  }

  Future<Album> getById(final int id) async {
    return _DATA.firstWhere((album) => album.albumId == id);
  }

  Future<List<Album>> getRecentlyListened() async {
    await _init();

    List<Album> shuffledData = List.from(_DATA);
    shuffledData.shuffle(Random());
    return shuffledData.take(6).toList();
  }

  Future<List<HomeSectionDTO>> getHomeInfo() async {
    await _init();

    List<HomeSectionDTO> sections = [];
    List<Album> shuffledData = List.from(_DATA);

    List<String> titles = [
      "Álbuns Mais Ouvidos",
      "Novidades da Semana",
      "Lançamentos Recentes",
      "Top 10 Favoritos",
      "Sugestões Baseadas no Seu Gosto",
      "Em Alta",
      "Músicas Recomendadas",
      "Playlists Populares",
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
}
