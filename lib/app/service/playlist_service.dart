import 'dart:convert';

import 'package:flutter/services.dart';
import 'package:wave_flutter/app/models/entities/playlist.dart';
import 'package:wave_flutter/app/models/entities/song.dart';

class PlaylistService {
  List<Playlist> _DATA = [];

  PlaylistService() {
    _init();
  }

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

  Playlist add(final List<Song> songs) {
    Playlist lastPlaylist = _DATA.last;
    Playlist newPlaylist = Playlist(
      playlistId: "${int.parse(lastPlaylist.playlistId) + 1}",
      title: 'Playlist ${int.parse(lastPlaylist.playlistId) + 1}',
      image: "https://www.qobuz.com/assets-static/img/suggestion/default.png",
      songs: songs,
    );
    _DATA.add(newPlaylist);

    return newPlaylist;
  }
}
