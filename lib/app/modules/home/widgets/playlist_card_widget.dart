import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:wave_flutter/app/models/entities/artist.dart';
import 'package:wave_flutter/app/models/entities/playlist.dart';

class PlaylistCardWidget extends StatelessWidget {
  final Playlist playlist;

  PlaylistCardWidget({required this.playlist});

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

    return InkWell(
        onTap: () {
          context.push('/details/${playlist.playlistId}');
        },
        child: Card(
          color: Colors.transparent,
          margin: EdgeInsets.symmetric(horizontal: 8.0),
          child: ConstrainedBox(
            constraints: BoxConstraints(
              maxWidth: 150,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Image.network(
                  playlistImage,
                  width: 150,
                  height: 150,
                  fit: BoxFit.cover,
                ),
                const SizedBox(height: 8.0),
                Padding(
                  padding: const EdgeInsets.only(right: 8.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        playlistTitle,
                        style: TextStyle(
                          fontSize: 16,
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          overflow: TextOverflow.ellipsis,
                        ),
                        maxLines: 1,
                      ),
                      Text(
                        "Playlist • ${playlistArtists}",
                        style: TextStyle(
                          color: Colors.grey,
                          overflow: TextOverflow.ellipsis,
                        ),
                        maxLines: 1,
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ));
  }
}
