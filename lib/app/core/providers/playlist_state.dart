import 'package:flutter/foundation.dart';
import 'package:wave_flutter/app/models/entities/playlist.dart';

class PlaylistState extends ChangeNotifier {
  List<Playlist> _playlists = [];

  List<Playlist> get playlists => _playlists;

  void addPlaylist(Playlist playlist) {
    _playlists.add(playlist);
    notifyListeners();
  }

  void setPlaylists(List<Playlist> playlists) {
    _playlists = List.from(playlists);
    notifyListeners();
  }
}
