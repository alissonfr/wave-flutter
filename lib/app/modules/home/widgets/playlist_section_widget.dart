import 'package:flutter/material.dart';
import 'package:wave_flutter/app/models/entities/playlist.dart';
import 'package:wave_flutter/app/modules/home/widgets/playlist_card_widget.dart';

class PlaylistSectionWidget extends StatelessWidget {
  final List<Playlist> playlists;

  PlaylistSectionWidget({required this.playlists});

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
                "Minhas playlists",
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
              itemCount: playlists.length,
              itemBuilder: (context, index) {
                final playlist = playlists[index];
                return PlaylistCardWidget(playlist: playlist);
              },
            ),
          ),
        ],
      ),
    );
  }
}
