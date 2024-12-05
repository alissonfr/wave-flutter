import 'package:flutter/material.dart';
import 'package:wave_flutter/app/shared/playlist/pages/create_playlist_page.dart';

class PlaylistModule extends StatefulWidget {
  const PlaylistModule({Key? key}) : super(key: key);

  @override
  State<PlaylistModule> createState() => _PlaylistModuleState();
}

class _PlaylistModuleState extends State<PlaylistModule> {
  @override
  Widget build(BuildContext context) {
    return CreatePlaylistPage();
  }
}
