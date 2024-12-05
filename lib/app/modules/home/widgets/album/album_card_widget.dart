import 'package:flutter/material.dart';
import 'package:wave_flutter/app/models/entities/album.dart';
import 'package:go_router/go_router.dart';
import 'package:wave_flutter/app/modules/home/widgets/card_widget.dart';

class AlbumCardWidget extends StatelessWidget {
  final Album album;

  const AlbumCardWidget({required this.album, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final albumImage = album.images.lowQuality;
    final albumTitle = album.title;
    final albumArtists = album.artists.map((artist) => artist.name).join(", ");

    return CardWidget(
      imageUrl: albumImage,
      title: albumTitle,
      subtitle: "Álbum • $albumArtists",
      onTap: () => context.push('/album-details/${album.albumId}'),
    );
  }
}
