import 'package:flutter/material.dart';
import 'package:wave_flutter/app/models/entities/album.dart';
import 'package:go_router/go_router.dart';

class AlbumCard extends StatelessWidget {
  final Album album;

  AlbumCard({required this.album});

  @override
  Widget build(BuildContext context) {
    final albumImage = album.images.lowQuality;
    final albumTitle = album.title;
    final albumArtists = album.artists.map((artist) => artist.name).join(", ");

    return Card(
        color: Colors.transparent,
        margin: EdgeInsets.symmetric(horizontal: 8.0),
        child: InkWell(
          onTap: () {
            context.push('/details/${album.albumId}');
          },
          child: ConstrainedBox(
            constraints: BoxConstraints(
              maxWidth: 150,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Image.network(
                  albumImage,
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
                        albumTitle,
                        style: TextStyle(
                          fontSize: 16,
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          overflow: TextOverflow.ellipsis,
                        ),
                        maxLines: 1,
                      ),
                      Text(
                        albumArtists,
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
