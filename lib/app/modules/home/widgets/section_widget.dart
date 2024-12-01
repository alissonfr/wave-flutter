import 'package:flutter/material.dart';
import 'package:wave_flutter/app/service/album_service.dart';
import 'album_card.dart';

class SectionWidget extends StatelessWidget {
  final String title;
  final List<Album> albums;

  SectionWidget({required this.title, required this.albums});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(title,
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
          const SizedBox(height: 8.0),
          Container(
            height: 220,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: albums.length,
              itemBuilder: (context, index) {
                final album = albums[index];
                return AlbumCard(album: album);
              },
            ),
          ),
        ],
      ),
    );
  }
}
