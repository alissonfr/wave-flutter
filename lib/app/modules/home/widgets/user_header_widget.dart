import 'package:flutter/material.dart';
import 'package:wave_flutter/app/models/enums/genres.dart';
import 'package:wave_flutter/app/service/album_service.dart';

class UserHeaderWidget extends StatefulWidget {
  const UserHeaderWidget({Key? key}) : super(key: key);

  @override
  State<UserHeaderWidget> createState() => _UserHeaderState();
}

class _UserHeaderState extends State<UserHeaderWidget> {
  final AlbumService albumService = AlbumService();

  String _selectedFilter = GenresEnum.ALL.name;

  @override
  Widget build(BuildContext context) {
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
                  backgroundImage: NetworkImage(
                    'https://via.placeholder.com/150',
                  ),
                ),
                const SizedBox(width: 16),
                Expanded(
                  child: SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: FutureBuilder(
                      future: albumService.getGenres(),
                      builder: (context, snapshot) {
                        if (snapshot.connectionState ==
                            ConnectionState.waiting) {
                          return const Center(
                              child: CircularProgressIndicator());
                        } else if (snapshot.hasError) {
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
                                  selected: _selectedFilter == filter["value"],
                                  onSelected: (isSelected) {
                                    setState(() {
                                      _selectedFilter = filter["value"]!;
                                    });
                                  },
                                  selectedColor: Colors.primaries.first,
                                  backgroundColor: Colors.grey[800],
                                  labelStyle: TextStyle(
                                    fontSize: 12,
                                    color: _selectedFilter == filter["label"]
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
