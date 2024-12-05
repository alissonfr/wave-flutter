import 'package:flutter/material.dart';
import 'package:wave_flutter/app/shared/details/pages/Playlist_details_page.dart';

class PlaylistDetailsModule extends StatelessWidget {
  final id;

  const PlaylistDetailsModule({Key? key, required this.id}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return PlaylistDetailsPage(id: id);
  }
}