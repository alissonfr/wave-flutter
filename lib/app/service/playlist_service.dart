import 'dart:convert';

import 'package:flutter/services.dart';
import 'package:wave_flutter/app/models/entities/playlist.dart';

class PlaylistService {
  List<Playlist> _DATA = [];

  Future<void> _init() async {
    final String jsonString =
        await rootBundle.loadString('assets/playlists.json');
    Map<String, dynamic> albumMap = jsonDecode(jsonString);
    _DATA = (albumMap['playlists'] as List)
        .map((playlistJson) => Playlist.fromJson(playlistJson))
        .toList();
  }

  Future<List<Playlist>> get() async {
    await _init();
    return _DATA;
  }

  Future<Playlist> getById(final String id) async {
    await _init();
    return _DATA.firstWhere((album) => album.playlistId == id);
  }
}
