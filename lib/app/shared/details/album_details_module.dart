import 'package:flutter/material.dart';
import 'package:wave_flutter/app/shared/details/pages/album_details_page.dart';

class AlbumDetailsModule extends StatelessWidget {
  final id;

  const AlbumDetailsModule({Key? key, required this.id}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AlbumDetailsPage(id: id);
  }
}
