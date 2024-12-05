import 'package:flutter/material.dart';
import 'package:wave_flutter/app/models/entities/album.dart';
import 'package:go_router/go_router.dart';

class AlbumGridWidget extends StatelessWidget {
  final List<Album> albums;

  AlbumGridWidget({required this.albums});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 8, right: 8),
      child: GridView.builder(
        padding: EdgeInsets.zero,
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          mainAxisSpacing: 0.0,
          crossAxisSpacing: 0.0,
          childAspectRatio: 2 / 0.5,
        ),
        itemCount: albums.length,
        itemBuilder: (context, index) {
          return _getAlbumItem(context, albums[index]);
        },
      ),
    );
  }

  Widget _getAlbumItem(BuildContext context, Album album) {
    return Card(
      color: const Color(0xFF292929),
      elevation: 4.0,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(8),
      ),
      child: InkWell(
        onTap: () {
          context.push('/details/${album.albumId}');
        },
        child: Row(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(2),
              child: Image.network(
                album.images.lowQuality,
                fit: BoxFit.fitHeight,
                height: double.infinity,
                // width: 100,
              ),
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.only(left: 8.0, right: 8.0),
                child: Text(
                  album.title,
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                  overflow: TextOverflow.ellipsis,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
