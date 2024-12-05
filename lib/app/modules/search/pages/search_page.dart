// ignore_for_file: camel_case_types, file_names

import 'package:flutter/material.dart';
import 'package:wave_flutter/app/models/entities/song.dart';
import 'package:wave_flutter/app/service/album_service.dart';

class Palette {
  static const MaterialColor primaryColor =
      MaterialColor(0xFF1DB954, <int, Color>{});

  static const MaterialColor secondaryColor =
      MaterialColor(0xFF121212, <int, Color>{});

  static const MaterialColor secondarySwatchColor =
      MaterialColor(0xFF2A2A2A, <int, Color>{});
}

class SearchPage extends StatefulWidget {
  const SearchPage({Key? key}) : super(key: key);

  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  ScrollController scrollController = ScrollController();
  final TextEditingController searchController = TextEditingController();
  bool showSearchBar = false;
  List<Song> allSongs = [];
  List<Song> filteredSongs = [];

  final AlbumService _albumService = AlbumService();

  @override
  void initState() {
    super.initState();
    _loadAlbums();
    searchController.addListener(_filterAlbums);
  }

  Future<void> _loadAlbums() async {
    var albums = await _albumService.get();
    for (var album in albums) {
      allSongs.addAll(album.songs);
    }

    setState(() {
      filteredSongs = allSongs;
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

  @override
  void dispose() {
    searchController.removeListener(_filterAlbums);
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
                // GridView para exibir os álbuns
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
                                InkWell(
                                  onTap: () {
                                    showModalBottomSheet(
                                      context: context,
                                      builder: (BuildContext context) {
                                        return Container(
                                          color: Colors.black,
                                          height: 200,
                                          child: Center(
                                            child: Text(
                                              'Opções para ${song.title}',
                                              style: TextStyle(
                                                  color: Colors.white),
                                            ),
                                          ),
                                        );
                                      },
                                    );
                                  },
                                  child: Padding(
                                    padding: EdgeInsets.all(8.0),
                                    child: Icon(Icons.more_horiz,
                                        color: Colors.white),
                                  ),
                                ),
                              ],
                            ),
                          )),
                    );
                  },
                ),
              ],
            ),
          )),
    );
  }
}
