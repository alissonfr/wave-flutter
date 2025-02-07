import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:wave_flutter/app/core/providers/genre_state.dart';
import 'package:wave_flutter/app/models/enums/genres.dart';
import 'package:wave_flutter/app/service/album_service.dart';
import 'package:wave_flutter/app/core/providers/auth_provider.dart';

class UserHeaderWidget extends StatefulWidget {
  const UserHeaderWidget({Key? key}) : super(key: key);

  @override
  State<UserHeaderWidget> createState() => _UserHeaderState();
}

class _UserHeaderState extends State<UserHeaderWidget> {
  final AlbumService albumService = AlbumService();

  @override
  Widget build(BuildContext context) {
    final authProvider = context.watch<AuthProvider>();
    final genreState = context.watch<GenreState>();

    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                authProvider.user != null
                    ? GestureDetector(
                        onTap: () {
                          _showUserMenu(context, authProvider);
                        },
                        child: CircleAvatar(
                          radius: 24,
                          backgroundImage: NetworkImage(
                              authProvider.user!.photoURL ??
                                  'https://example.com/default-avatar.png'),
                        ),
                      )
                    : GestureDetector(
                        onTap: () async {
                          await authProvider.signInWithGoogle();
                        },
                        child: const Icon(Icons.login, size: 30),
                      ),
                const SizedBox(width: 16),
                Expanded(
                  child: SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: FutureBuilder(
                      future: albumService.getTrendingGenres(),
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

  void _showUserMenu(BuildContext context, AuthProvider authProvider) {
    showModalBottomSheet(
      context: context,
      builder: (context) {
        return Container(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              ListTile(
                title: Text(authProvider.user?.displayName ?? 'Usuário'),
                subtitle:
                    Text(authProvider.user?.email ?? 'Email não disponível'),
              ),
              const Divider(),
              ListTile(
                leading: const Icon(Icons.logout),
                title: const Text('Logout'),
                onTap: () async {
                  await authProvider.logout();
                  Navigator.pop(context);
                },
              ),
            ],
          ),
        );
      },
    );
  }
}
