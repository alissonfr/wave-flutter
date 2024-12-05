import 'dart:convert';

import 'package:flutter/services.dart';
import 'package:wave_flutter/app/models/entities/playlist.dart';
import 'package:wave_flutter/app/models/entities/song.dart';

class PlaylistService {
  static final PlaylistService _instance = PlaylistService._internal();
  List<Playlist> _DATA = [];

  PlaylistService._internal();

  factory PlaylistService() {
    return _instance;
  }

  Future<void> _init() async {
    if (_DATA.isNotEmpty) return;
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
      title: 'Playlist #${int.parse(lastPlaylist.playlistId) + 1}',
      image: "https://www.qobuz.com/assets-static/img/suggestion/default.png",
      songs: songs,
    );
    _DATA.add(newPlaylist);

    return newPlaylist;
  }

  void update(final String playlistId, final List<Song> updatedSongs) {
    int playlistToUpdate =
        _DATA.indexWhere((playlist) => playlist.playlistId == playlistId);

    _DATA[playlistToUpdate].songs.addAll(updatedSongs.where((song) =>
        !_DATA[playlistToUpdate]
            .songs
            .any((existingSong) => existingSong.songId == song.songId)));
  }
}
