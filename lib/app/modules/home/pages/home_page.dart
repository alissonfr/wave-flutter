import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:wave_flutter/app/core/providers/auth_provider.dart';
import 'package:wave_flutter/app/core/providers/genre_state.dart';
import 'package:wave_flutter/app/core/providers/playlist_state.dart';
import 'package:wave_flutter/app/models/dto/home_section.dart';
import 'package:wave_flutter/app/models/entities/album.dart';
import 'package:wave_flutter/app/models/entities/playlist.dart';
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
  final ScrollController _scrollController = ScrollController();
  List<HomeSectionDTO> homeInfo = [];
  int currentPage = 0;
  final int itemsPerPage = 2;
  bool isLoadingMore = false;

  @override
  void initState() {
    super.initState();
    _scrollController.addListener(_onScroll);
    _loadInitialData();
    context.read<GenreState>().addListener(_onGenreChange);
  }

  void _onGenreChange() {
    _loadInitialData();
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  void _onScroll() {
    if (_scrollController.position.pixels >=
        _scrollController.position.maxScrollExtent - 200) {
      _loadMoreData();
    }
  }

  Future<void> _loadInitialData() async {
    final selectedGenre = context.read<GenreState>().selectedGenre;
    final List<HomeSectionDTO> initialHomeInfo =
        await albumService.getTrendings(selectedGenre);
    setState(() {
      homeInfo = initialHomeInfo.take(itemsPerPage).toList();
      currentPage = 1;
    });
  }

  Future<void> _loadMoreData() async {
    if (isLoadingMore) return;
    setState(() {
      isLoadingMore = true;
    });

    await Future.delayed(Duration(seconds: 1));
    final selectedGenre = context.read<GenreState>().selectedGenre;
    final List<HomeSectionDTO> newHomeInfo =
        await albumService.getTrendings(selectedGenre);
    final int startIndex = currentPage * itemsPerPage;
    final int endIndex = startIndex + itemsPerPage;

    setState(() {
      var subList = newHomeInfo.sublist(startIndex,
          endIndex > newHomeInfo.length ? newHomeInfo.length : endIndex);

      if (subList.isEmpty) {
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          content: Text('Sem mais músicas para exibir!'),
        ));
        isLoadingMore = false;
        return;
      }
      homeInfo.addAll(subList);
      currentPage++;
      isLoadingMore = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    final selectedGenre = context.watch<GenreState>().selectedGenre;
    final playlists = context.watch<PlaylistState>().playlists;
    final authProvider = context.watch<AuthProvider>();

    return Scaffold(
      body: FutureBuilder(
        future: Future.wait([
          albumService.find(selectedGenre),
          playlistService.find(),
        ]),
        builder: (context, snapshot) {
          if (snapshot.hasError) {
            return const Center(child: Text('Erro ao carregar dados'));
          } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
            return const Center(child: Text('Nenhum item encontrado'));
          } else {
            final List<Album> filteredAlbums = snapshot.data?[0] as List<Album>;
            final List<Playlist> loadedPlaylists =
                snapshot.data?[1] as List<Playlist>;

            if (playlists.isEmpty) {
              playlists.addAll(loadedPlaylists);
            }

            return SingleChildScrollView(
              controller: _scrollController,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  UserHeaderWidget(),
                  AlbumGridWidget(albums: filteredAlbums),
                  const SizedBox(height: 16.0),
                  authProvider.user != null &&
                          (selectedGenre == null ||
                              selectedGenre.genreId.isEmpty)
                      ? PlaylistSection(playlists: playlists)
                      : const SizedBox(),
                  ListView.builder(
                    padding: EdgeInsets.zero,
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    itemCount: homeInfo.length + (isLoadingMore ? 1 : 0),
                    itemBuilder: (context, index) {
                      if (index == homeInfo.length) {
                        return const Padding(
                          padding: EdgeInsets.only(bottom: 32),
                          child: Center(child: CircularProgressIndicator()),
                        );
                      }
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
