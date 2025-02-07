import 'package:flutter/material.dart';
import 'package:wave_flutter/app/modules/details/pages/album_details_page.dart';

class AlbumDetailsModule extends StatelessWidget {
  final String id;

  const AlbumDetailsModule({Key? key, required this.id}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AlbumDetailsPage(id: id);
  }
}
