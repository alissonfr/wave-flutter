import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:wave_flutter/app/models/entities/playlist.dart';
import 'package:wave_flutter/app/modules/home/widgets/playlist/playlist_card_widget.dart';
import 'package:wave_flutter/app/modules/home/widgets/section_widget.dart';

class PlaylistSection extends StatelessWidget {
  final List<Playlist> playlists;

  const PlaylistSection({required this.playlists, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SectionWidget<Playlist>(
      title: "Minhas Playlists",
      items: playlists,
      itemBuilder: (context, playlist) =>
          PlaylistCardWidget(playlist: playlist),
      titleFunction: () => context.push('/create-playlist'),
    );
  }
}
