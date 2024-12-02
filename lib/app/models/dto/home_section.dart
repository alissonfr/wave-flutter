import 'package:wave_flutter/app/models/entities/album.dart';

class HomeSectionDTO {
  final String title;
  final List<Album> albums;

  HomeSectionDTO({
    required this.title,
    required this.albums,
  });
}
