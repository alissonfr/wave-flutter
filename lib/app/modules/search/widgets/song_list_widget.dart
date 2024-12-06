import 'package:flutter/material.dart';
import 'package:wave_flutter/app/models/entities/song.dart';
import 'package:wave_flutter/app/modules/search/widgets/song_item_widget.dart';

class SongListWidget extends StatelessWidget {
  final ScrollController scrollController;
  final List<Song> songs;
  final bool isLoading;

  const SongListWidget({
    Key? key,
    required this.scrollController,
    required this.songs,
    required this.isLoading,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      controller: scrollController,
      child: Column(
        children: [
          ListView.builder(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemCount: songs.length,
            itemBuilder: (context, index) {
              final song = songs[index];
              return SongItemWidget(song: song);
            },
          ),
          if (isLoading)
            const Padding(
              padding: EdgeInsets.only(bottom: 32),
              child: Center(child: CircularProgressIndicator()),
            ),
        ],
      ),
    );
  }
}
