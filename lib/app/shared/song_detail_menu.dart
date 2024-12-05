import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:wave_flutter/app/models/entities/playlist.dart';
import 'package:wave_flutter/app/models/entities/song.dart';
import 'package:wave_flutter/app/service/playlist_service.dart';

class SongDetailMenu extends StatelessWidget {
  static final String URL = 'https://genius.com/2pac-hit-em-up-lyrics';
  final Song song;
  final PlaylistService playlistService = PlaylistService();

  SongDetailMenu({Key? key, required this.song}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return IconButton(
      padding: EdgeInsets.zero,
      icon: Icon(Icons.more_horiz, color: Colors.white),
      onPressed: () async {
        final RenderBox overlay =
            Overlay.of(context).context.findRenderObject() as RenderBox;
        final RenderBox button = context.findRenderObject() as RenderBox;
        final Offset position =
            button.localToGlobal(Offset.zero, ancestor: overlay);
        final Size size = button.size;

        try {
          final result = await showMenu<int>(
            context: context,
            position: RelativeRect.fromLTRB(
              position.dx,
              position.dy + size.height,
              position.dx + size.width,
              position.dy,
            ),
            items: [
              PopupMenuItem<int>(
                value: 0,
                child: Text("Adicionar a playlist"),
              ),
              PopupMenuItem<int>(
                value: 1,
                child: Text("Detalhes"),
              ),
            ],
          );

          if (result == 1) {
            _showSongDetailsBottomSheet(context, song);
          } else if (result == 0) {
            _showAddToPlaylistMenu(context);
          }
        } catch (e) {
          print("Error showing menu: $e");
        }
      },
    );
  }

  // Exibir o bottom sheet com detalhes da música
  static void _showSongDetailsBottomSheet(BuildContext context, Song song) {
    showModalBottomSheet(
      context: context,
      builder: (BuildContext context) {
        return Container(
          padding: EdgeInsets.all(16),
          color: Colors.black,
          height: 600,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    song.title,
                    style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 16),
                  ),
                  InkWell(
                    onTap: () => Navigator.pop(context),
                    child: Text(
                      "Cancelar",
                      style: TextStyle(color: Colors.white),
                    ),
                  )
                ],
              ),
              SizedBox(height: 24),
              Text(
                "Interpretada por",
                style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 22),
              ),
              SizedBox(height: 6),
              Text(
                song.artists.map((artist) => artist.name).join(', '),
                style: TextStyle(color: Colors.white, fontSize: 14),
              ),
              SizedBox(height: 12),
              Text(
                "Escrita por",
                style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 22),
              ),
              SizedBox(height: 6),
              Text(
                song.artists.map((artist) => artist.name).join(', '),
                style: TextStyle(color: Colors.white, fontSize: 14),
              ),
              SizedBox(height: 12),
              Text(
                "Produzida por",
                style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 22),
              ),
              SizedBox(height: 6),
              Text(
                song.artists.map((artist) => artist.name).join(', '),
                style: TextStyle(color: Colors.white, fontSize: 14),
              ),
              SizedBox(height: 12),
              Text(
                "Letra",
                style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 22),
              ),
              SizedBox(height: 6),
              InkWell(
                onTap: _launchURL, // Quando o link for tocado
                child: Text(
                  URL,
                  style: TextStyle(color: Colors.blue, fontSize: 14),
                ),
              ),
              SizedBox(height: 12),
              song.artists.length > 1
                  ? Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Artistas relacionados",
                          style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 22),
                        ),
                        SizedBox(height: 6),
                        Text(
                          song.artists
                              .sublist(1)
                              .map((artist) => artist.name)
                              .join(', '),
                          style: TextStyle(color: Colors.white, fontSize: 14),
                        )
                      ],
                    )
                  : SizedBox(),
            ],
          ),
        );
      },
    );
  }

  // Lançar a URL
  static void _launchURL() async {
    final url = Uri.parse(URL);
    if (await canLaunchUrl(url)) {
      await launchUrl(url);
    } else {
      throw 'Não foi possível abrir o link: $url';
    }
  }

  // Exibir as playlists para adicionar a música
  void _showAddToPlaylistMenu(BuildContext context) async {
    final playlists = await playlistService.get();
    final selectedPlaylist = await showDialog<Playlist>(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text('Escolha uma playlist'),
          content: SizedBox(
            width: double.maxFinite,
            child: ListView(
              children: playlists
                  .map(
                    (playlist) => ListTile(
                      title: Text(playlist.title),
                      onTap: () {
                        Navigator.pop(context, playlist);
                      },
                    ),
                  )
                  .toList(),
            ),
          ),
        );
      },
    );

    if (selectedPlaylist != null) {
      playlistService.update(selectedPlaylist.playlistId, [song]);
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: Text('Música adicionada à ${selectedPlaylist.title}!'),
      ));
    }
  }
}
