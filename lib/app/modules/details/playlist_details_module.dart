import 'package:flutter/material.dart';
import 'package:wave_flutter/app/modules/details/pages/playlist_details_page.dart';

class PlaylistDetailsModule extends StatelessWidget {
  final String id;

  const PlaylistDetailsModule({Key? key, required this.id}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return PlaylistDetailsPage(id: id);
  }
}
