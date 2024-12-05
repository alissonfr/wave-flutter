import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:wave_flutter/app/models/entities/artist.dart';
import 'package:wave_flutter/app/models/entities/playlist.dart';
import 'package:wave_flutter/app/service/playlist_service.dart';
import 'package:wave_flutter/app/shared/song_detail_menu.dart';

class PlaylistDetailsPage extends StatelessWidget {
  final PlaylistService playlistService = PlaylistService();
  final String id;

  PlaylistDetailsPage({Key? key, required this.id}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: playlistService.getById(id),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(child: CircularProgressIndicator());
        } else if (snapshot.hasError) {
          print(snapshot);
          return const Center(child: Text('Erro ao carregar dados'));
        } else if (!snapshot.hasData || snapshot.data == null) {
          return const Center(child: Text('Nenhum item encontrado'));
        } else {
          final Playlist playlist = snapshot.data as Playlist;
          final List<Artist> artists = playlist.songs
              .map((song) => song.artists)
              .expand((element) => element)
              .toList();
          final playlistArtists =
              artists.take(3).map((artist) => artist.name).join(", ");

          return Scaffold(
            backgroundColor: Colors.black,
            appBar: AppBar(
              leading: IconButton(
                icon: Icon(
                  Icons.chevron_left,
                  size: 28,
                  color: Colors.primaries.first,
                ),
                onPressed: () {
                  context.pop();
                },
              ),
              backgroundColor: Colors.black,
              elevation: 0,
            ),
            body: SingleChildScrollView(
              child: Column(
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(6),
                    child: Container(
                      width: 300,
                      height: 300,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(6),
                        image: DecorationImage(
                          image: NetworkImage(playlist.image),
                          fit: BoxFit.cover,
                        ),
                        border: Border.all(
                          color: Colors.grey.shade800,
                          width: 1.0,
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 16),
                    child: Text(
                      playlist.title,
                      style: TextStyle(
                        fontSize: 22,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                      textAlign: TextAlign.start,
                    ),
                  ),
                  Text(
                    playlistArtists,
                    style: TextStyle(
                      fontSize: 18,
                      color: Colors.grey[400],
                    ),
                    textAlign: TextAlign.start,
                  ),
                  Padding(
                      padding: EdgeInsets.only(top: 16, bottom: 32),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          ElevatedButton.icon(
                            onPressed: () {
                              print('Reproduzir');
                            },
                            icon: Icon(Icons.play_arrow,
                                color: Colors.primaries.first),
                            label: Text('Reproduzir',
                                style: TextStyle(
                                    color: Colors.primaries.first,
                                    fontWeight: FontWeight.bold)),
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Color(0xFF1C1C1E),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(8),
                              ),
                              padding: EdgeInsets.symmetric(
                                  vertical: 10, horizontal: 30),
                            ),
                          ),
                          SizedBox(width: 20),
                          ElevatedButton.icon(
                            onPressed: () {
                              print('Aleatório');
                            },
                            icon: Icon(Icons.shuffle,
                                color: Colors.primaries.first),
                            label: Text('Aleatório',
                                style: TextStyle(
                                    color: Colors.primaries.first,
                                    fontWeight: FontWeight.bold)),
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Color(0xFF1C1C1E),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(8),
                              ),
                              padding: EdgeInsets.symmetric(
                                  vertical: 10, horizontal: 30),
                            ),
                          ),
                        ],
                      )),
                  ListView.builder(
                    shrinkWrap: true,
                    physics: NeverScrollableScrollPhysics(),
                    itemCount: playlist.songs.length,
                    itemBuilder: (context, index) {
                      final song = playlist.songs[index];
                      return Padding(
                        padding:
                            EdgeInsets.only(left: 12, right: 12, bottom: 8),
                        child: InkWell(
                            onTap: () {
                              print('Linha da música clicada: ${song.title}');
                            },
                            child: Padding(
                              padding: EdgeInsets.only(
                                  left: 8, right: 8, top: 4, bottom: 4),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Expanded(
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          song.title,
                                          style: TextStyle(
                                            color: Colors.white,
                                            fontWeight: FontWeight.bold,
                                          ),
                                          maxLines: 1,
                                          overflow: TextOverflow.ellipsis,
                                        ),
                                        Text(
                                          song.artists
                                              .map((artist) => artist.name)
                                              .join(', '),
                                          style: TextStyle(color: Colors.grey),
                                          maxLines: 1,
                                          overflow: TextOverflow.ellipsis,
                                        ),
                                      ],
                                    ),
                                  ),
                                  SongDetailMenu(song: song),
                                ],
                              ),
                            )),
                      );
                    },
                  ),
                ],
              ),
            ),
          );
        }
      },
    );
  }
}
