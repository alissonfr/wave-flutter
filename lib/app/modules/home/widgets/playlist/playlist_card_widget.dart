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

    return Row(
      children: [
        CardWidget(
          imageUrl: playlistImage,
          title: playlistTitle,
          subtitle: "Playlist • $playlistArtists",
          onTap: () => context.push('/details/${playlist.playlistId}'),
        ),
        Padding(
          padding: const EdgeInsets.only(left: 10, bottom: 30),
          child: IconButton(
            icon: Icon(
              Icons.add,
              size: 50,
              color: Colors.primaries.first,
            ),
            style: ButtonStyle(
              backgroundColor: WidgetStatePropertyAll(Colors.black),
              padding: WidgetStateProperty.all(EdgeInsets.all(10)),
            ),
            onPressed: () {
              context.pop();
            },
          ),
        )
      ],
    );
  }
}
