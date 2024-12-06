import 'package:flutter/material.dart';
import 'package:wave_flutter/app/models/entities/song.dart';
import 'package:wave_flutter/app/shared/widgets/song_detail_menu.dart';

class SongItemWidget extends StatelessWidget {
  final Song song;

  const SongItemWidget({Key? key, required this.song}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8),
      child: InkWell(
        onTap: () {
          print('Linha da música clicada: ${song.title}');
        },
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      song.title,
                      style: const TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                    Text(
                      song.artists.map((artist) => artist.name).join(', '),
                      style: const TextStyle(color: Colors.grey),
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ],
                ),
              ),
              SongDetailMenu(song: song),
            ],
          ),
        ),
      ),
    );
  }
}
