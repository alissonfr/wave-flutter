import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:wave_flutter/app/core/providers/genre_state.dart';
import 'package:wave_flutter/app/models/enums/genres.dart';
import 'package:wave_flutter/app/service/album_service.dart';

class UserHeaderWidget extends StatefulWidget {
  const UserHeaderWidget({Key? key}) : super(key: key);

  @override
  State<UserHeaderWidget> createState() => _UserHeaderState();
}

class _UserHeaderState extends State<UserHeaderWidget> {
  final AlbumService albumService = AlbumService();

  @override
  Widget build(BuildContext context) {
    final genreState = context.watch<GenreState>();

    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                CircleAvatar(
                  radius: 24,
                  backgroundImage: AssetImage(
                    'assets/images/user.png',
                  ),
                ),
                const SizedBox(width: 16),
                Expanded(
                  child: SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: FutureBuilder(
                      future: albumService.getGenres(),
                      builder: (context, snapshot) {
                        if (snapshot.hasError) {
                          return const Center(
                              child: Text('Erro ao carregar dados'));
                        } else if (!snapshot.hasData ||
                            snapshot.data!.isEmpty) {
                          return const Center(
                              child: Text('Nenhum item encontrado'));
                        } else {
                          final List<Map<String, String>> filters =
                              snapshot.data as List<Map<String, String>>;

                          return Row(
                            children: filters.map((filter) {
                              return Padding(
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 4.0),
                                child: FilterChip(
                                  label: Text(filter["label"]!),
                                  selected: genreState.selectedGenre ==
                                      GenresEnum.fromValue(filter["value"]!),
                                  onSelected: (isSelected) {
                                    genreState.setGenre(
                                        GenresEnum.fromValue(filter["value"]!));
                                  },
                                  selectedColor: Colors.primaries.first,
                                  backgroundColor: Colors.grey[800],
                                  labelStyle: TextStyle(
                                    fontSize: 12,
                                    color: genreState.selectedGenre ==
                                            filter["value"]
                                        ? Colors.white
                                        : Colors.white,
                                  ),
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(16),
                                    side: BorderSide(color: Colors.transparent),
                                  ),
                                  showCheckmark: false,
                                ),
                              );
                            }).toList(),
                          );
                        }
                      },
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
