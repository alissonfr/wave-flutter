// ignore_for_file: camel_case_types, file_names

import 'package:flutter/material.dart';
import 'package:wave_flutter/app/core/theme/app_theme.dart';
import 'package:wave_flutter/app/models/entities/song.dart';
import 'package:wave_flutter/app/modules/search/widgets/header_widget.dart';
import 'package:wave_flutter/app/modules/search/widgets/search_bar_widget.dart';
import 'package:wave_flutter/app/modules/search/widgets/song_list_widget.dart';
import 'package:wave_flutter/app/service/album_service.dart';

class SearchPage extends StatefulWidget {
  const SearchPage({Key? key}) : super(key: key);

  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  final TextEditingController searchController = TextEditingController();
  final ScrollController _scrollController = ScrollController();
  bool showSearchBar = false;
  List<Song> songs = [];
  int currentPage = 1;
  bool isLoading = false;

  final AlbumService _albumService = AlbumService();

  @override
  void initState() {
    super.initState();
    _loadSongs();
    searchController.addListener(_filterAlbums);
    _scrollController.addListener(_onScroll);
  }

  Future<void> _loadSongs({int page = 1}) async {
    if (isLoading) return;
    setState(() {
      isLoading = true;
    });

    var res = await _albumService.getSongs(page: page);
    setState(() {
      if (res.isEmpty) {
        ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
          content: Text('Sem mais músicas para exibir!'),
        ));
        isLoading = false;
        return;
      }

      songs.addAll(res);
      currentPage = page;
      isLoading = false;
    });
  }

  void _filterAlbums() async {
    String query = searchController.text.toLowerCase();
    List<Song> filteredSongs = await _albumService.getSongs(title: query);

    setState(() {
      songs = filteredSongs;
    });
  }

  void _onScroll() {
    if (_scrollController.position.pixels >=
        _scrollController.position.maxScrollExtent - 200) {
      _loadSongs(page: currentPage + 1);
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
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const HeaderWidget(),
            const SizedBox(height: 16),
            SearchBarWidget(controller: searchController),
            const SizedBox(height: 16),
            Expanded(
              child: SongListWidget(
                scrollController: _scrollController,
                songs: songs,
                isLoading: isLoading,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
