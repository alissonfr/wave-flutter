import 'package:flutter/material.dart';

class AlbumCard extends StatelessWidget {
  final Map<String, dynamic> album;

  AlbumCard({required this.album});

  @override
  Widget build(BuildContext context) {
    final albumImage = album['image'];
    final albumTitle = album['title'];
    final albumArtists =
        album['artists'].map((artist) => artist['name']).join(", ");

    return Card(
      color: Colors.transparent,
      margin: EdgeInsets.symmetric(horizontal: 8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Image.network(albumImage, width: 150, height: 150, fit: BoxFit.cover),
          const SizedBox(height: 8.0),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(albumTitle,
                  style: TextStyle(
                      fontSize: 16,
                      color: Colors.white,
                      fontWeight: FontWeight.bold)),
              Text(albumArtists, style: TextStyle(color: Colors.grey))
            ],
          )
        ],
      ),
    );
  }
}
