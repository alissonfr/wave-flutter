import 'package:flutter/material.dart';
import 'package:wave_flutter/app/models/entities/album.dart';
import 'package:wave_flutter/app/modules/home/widgets/album/album_card_widget.dart';
import 'package:wave_flutter/app/modules/home/widgets/section_widget.dart';

class AlbumSection extends StatelessWidget {
  final String title;
  final List<Album> albums;

  const AlbumSection({required this.title, required this.albums, Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SectionWidget<Album>(
      title: title,
      items: albums,
      itemBuilder: (context, album) => AlbumCardWidget(album: album),
    );
  }
}
