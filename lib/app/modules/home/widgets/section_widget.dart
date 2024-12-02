import 'package:flutter/material.dart';
import 'package:wave_flutter/app/models/entities/album.dart';

import 'album_card.dart';

class SectionWidget extends StatelessWidget {
  final String title;
  final List<Album> albums;

  SectionWidget({required this.title, required this.albums});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 22.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
              padding: EdgeInsets.only(left: 8),
              child: Text(
                title,
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              )),
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
