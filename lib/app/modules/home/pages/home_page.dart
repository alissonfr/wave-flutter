import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:wave_flutter/app/core/providers/genre_state.dart';
import 'package:wave_flutter/app/core/providers/playlist_state.dart';
import 'package:wave_flutter/app/models/dto/home_section.dart';
import 'package:wave_flutter/app/models/entities/album.dart';
import 'package:wave_flutter/app/models/entities/playlist.dart';
import 'package:wave_flutter/app/models/enums/genres.dart';
import 'package:wave_flutter/app/modules/home/widgets/album/album_grid_widget.dart';
import 'package:wave_flutter/app/modules/home/widgets/album/album_section_widget.dart';
import 'package:wave_flutter/app/modules/home/widgets/playlist/playlist_section_widget.dart';
import 'package:wave_flutter/app/modules/home/widgets/user_header_widget.dart';
import 'package:wave_flutter/app/service/album_service.dart';
import 'package:wave_flutter/app/service/playlist_service.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final AlbumService albumService = AlbumService();
  final PlaylistService playlistService = PlaylistService();

  @override
  Widget build(BuildContext context) {
    final selectedGenre = context.watch<GenreState>().selectedGenre;
    final playlists = context.watch<PlaylistState>().playlists;

    return Scaffold(
      body: FutureBuilder(
        future: Future.wait([
          albumService.getHomeInfo(selectedGenre),
          albumService.getByGenre(selectedGenre),
          playlistService.get(),
        ]),
        builder: (context, snapshot) {
          if (snapshot.hasError) {
            return const Center(child: Text('Erro ao carregar dados'));
          } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
            return const Center(child: Text('Nenhum item encontrado'));
          } else {
            final List<HomeSectionDTO> homeInfo =
                snapshot.data?[0] as List<HomeSectionDTO>;
            final List<Album> filteredAlbums = snapshot.data?[1] as List<Album>;
            final List<Playlist> loadedPlaylists =
                snapshot.data?[2] as List<Playlist>;

            if (playlists.isEmpty) {
              playlists.addAll(loadedPlaylists);
            }

            return SingleChildScrollView(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  UserHeaderWidget(),
                  AlbumGridWidget(albums: filteredAlbums),
                  const SizedBox(height: 16.0),
                  selectedGenre.name == GenresEnum.ALL.name
                      ? PlaylistSection(playlists: playlists)
                      : const SizedBox(),
                  ListView.builder(
                    padding: EdgeInsets.zero,
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    itemCount: homeInfo.length,
                    itemBuilder: (context, index) {
                      return AlbumSection(
                        title: homeInfo[index].title,
                        albums: homeInfo[index].albums,
                      );
                    },
                  ),
                ],
              ),
            );
          }
        },
      ),
    );
  }
}
