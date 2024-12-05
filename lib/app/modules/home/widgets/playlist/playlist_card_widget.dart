import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:wave_flutter/app/models/entities/artist.dart';
import 'package:wave_flutter/app/models/entities/playlist.dart';
import 'package:wave_flutter/app/modules/home/widgets/card_widget.dart';

class PlaylistCardWidget extends StatelessWidget {
  final Playlist playlist;

  const PlaylistCardWidget({required this.playlist, Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final playlistImage = playlist.image;
    final playlistTitle = playlist.title;
    final List<Artist> artists = playlist.songs
        .map((song) => song.artists)
        .expand((element) => element)
        .toList();
    final playlistArtists =
        artists.take(3).map((artist) => artist.name).join(", ");

    return CardWidget(
      imageUrl: playlistImage,
      title: playlistTitle,
      subtitle: "Playlist • $playlistArtists",
      onTap: () => context.push('/playlist-details/${playlist.playlistId}'),
    );
  }
}
