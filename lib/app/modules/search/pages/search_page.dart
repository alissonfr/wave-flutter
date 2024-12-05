// ignore_for_file: camel_case_types, file_names

import 'package:flutter/material.dart';
import 'package:wave_flutter/app/core/theme/app_theme.dart';
import 'package:wave_flutter/app/models/entities/song.dart';
import 'package:wave_flutter/app/service/album_service.dart';
import 'package:wave_flutter/app/shared/song_detail_menu.dart';

class SearchPage extends StatefulWidget {
  const SearchPage({Key? key}) : super(key: key);

  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  final TextEditingController searchController = TextEditingController();
  final ScrollController _scrollController = ScrollController();
  bool showSearchBar = false;
  List<Song> allSongs = [];
  List<Song> filteredSongs = [];
  int currentPage = 1;
  bool isLoading = false;

  final AlbumService _albumService = AlbumService();

  @override
  void initState() {
    super.initState();
    _loadAlbums();
    searchController.addListener(_filterAlbums);
    _scrollController.addListener(_onScroll);
  }

  Future<void> _loadAlbums({int page = 1}) async {
    if (isLoading) return;
    setState(() {
      isLoading = true;
    });

    await Future.delayed(Duration(seconds: 1));
    var songs = await _albumService.getSongs(page: page);
    setState(() {
      if (songs.isEmpty) {
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          content: Text('Sem mais músicas para exibir!'),
        ));
        isLoading = false;
        return;
      }

      allSongs.addAll(songs);
      filteredSongs = allSongs;
      currentPage = page;
      isLoading = false;
    });
  }

  void _filterAlbums() {
    String query = searchController.text.toLowerCase();
    setState(() {
      filteredSongs = allSongs.where((song) {
        return song.title.toLowerCase().contains(query) ||
            song.artists[0].name.toLowerCase().contains(query);
      }).toList();
    });
  }

  void _onScroll() {
    if (_scrollController.position.pixels >=
        _scrollController.position.maxScrollExtent - 200) {
      _loadAlbums(page: currentPage + 1);
    }
  }

  @override
  void dispose() {
    searchController.removeListener(_filterAlbums);
    _scrollController.removeListener(_onScroll);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 0,
        backgroundColor: Palette.secondaryColor,
      ),
      backgroundColor: Palette.secondaryColor,
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15),
        child: SingleChildScrollView(
          controller: _scrollController,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 35),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text(
                      "Buscar",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 25,
                        color: Colors.white,
                      ),
                    ),
                    IconButton(
                      onPressed: () {
                        print(""); // Adicione sua lógica aqui
                      },
                      highlightColor: Colors.transparent,
                      splashColor: Colors.transparent,
                      icon: const Icon(Icons.camera_alt_outlined,
                          color: Colors.white),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 16),
              TextField(
                controller: searchController,
                decoration: InputDecoration(
                  fillColor: Colors.white,
                  hintText: 'Pesquisar por artista ou música...',
                  prefixIcon: Icon(Icons.search),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8.0),
                  ),
                ),
              ),
              const SizedBox(height: 16),
              ListView.builder(
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                itemCount: filteredSongs.length,
                itemBuilder: (context, index) {
                  final song = filteredSongs[index];
                  return Padding(
                    padding: EdgeInsets.only(bottom: 8),
                    child: InkWell(
                      onTap: () {
                        print('Linha da música clicada: ${song.title}');
                      },
                      child: Padding(
                        padding: EdgeInsets.only(
                            left: 8, right: 8, top: 4, bottom: 4),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
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
                            SongDetailMenu(
                              song: song,
                            )
                          ],
                        ),
                      ),
                    ),
                  );
                },
              ),
              if (isLoading)
                const Padding(
                    padding: EdgeInsets.only(bottom: 32),
                    child: Center(child: CircularProgressIndicator())),
            ],
          ),
        ),
      ),
    );
  }
}
