import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:wave_flutter/app/core/providers/playlist_state.dart';
import 'package:wave_flutter/app/core/theme/app_theme.dart';
import 'package:wave_flutter/app/models/entities/playlist.dart';
import 'package:wave_flutter/app/models/entities/song.dart';
import 'package:wave_flutter/app/service/album_service.dart';
import 'package:wave_flutter/app/service/playlist_service.dart';

class CreatePlaylistPage extends StatefulWidget {
  const CreatePlaylistPage({Key? key}) : super(key: key);

  @override
  State<CreatePlaylistPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<CreatePlaylistPage> {
  ScrollController scrollController = ScrollController();
  final TextEditingController searchController = TextEditingController();
  bool showSearchBar = false;
  List<Song> allSongs = [];
  List<Song> filteredSongs = [];
  List<Song> selectedSongs = []; // Lista de músicas selecionadas

  final AlbumService _albumService = AlbumService();
  final PlaylistService _playlistService = PlaylistService();

  @override
  void initState() {
    super.initState();
    _loadAlbums();
    searchController.addListener(_filterAlbums);
  }

  Future<void> _loadAlbums() async {
    var albums = await _albumService.find();
    for (var album in albums) {
      allSongs.addAll(album.songs);
    }

    setState(() {
      filteredSongs = allSongs;
    });
  }

  void _filterAlbums() {
    String query = searchController.text.toLowerCase();
    setState(() async {
      // filteredSongs = _albumService.filterSongsByQuery(allSongs, query);
      filteredSongs = await _albumService.getSongs();
    });
  }

  void _toggleSelection(Song song) {
    setState(() {
      if (selectedSongs.contains(song)) {
        selectedSongs.remove(song);
      } else {
        selectedSongs.add(song);
      }
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
                        "Nova playlist",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 25,
                          color: Colors.white,
                        ),
                      ),
                      InkWell(
                        onTap: () async {
                          final playlistState = context.read<PlaylistState>();
                          Playlist newPlaylist =
                              await _playlistService.create(selectedSongs);
                          playlistState.addPlaylist(newPlaylist);
                          Navigator.pop(context);
                        },
                        child: Padding(
                          padding: EdgeInsets.all(8.0),
                          child: Text(
                            'Salvar',
                            style: TextStyle(
                              color: Colors.primaries.first,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
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
                    final isSelected = selectedSongs.contains(song);

                    return Padding(
                      padding: EdgeInsets.only(bottom: 8),
                      child: InkWell(
                        onTap: () => _toggleSelection(song),
                        child: Container(
                            decoration: BoxDecoration(
                              color: isSelected
                                  ? Colors.primaries.first.withOpacity(0.1)
                                  : Colors.transparent,
                              border: Border.all(
                                color: isSelected
                                    ? Colors.primaries.first
                                    : Colors.transparent,
                              ),
                              borderRadius: BorderRadius.circular(8.0),
                            ),
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
                                  Icon(
                                    isSelected ? Icons.check : Icons.add,
                                    color: isSelected
                                        ? Colors.primaries.first
                                        : Colors.white,
                                  ),
                                ],
                              ),
                            )),
                      ),
                    );
                  },
                ),
              ],
            ),
          )),
    );
  }
}
