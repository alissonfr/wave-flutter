import 'package:flutter/material.dart';

final GRAY_CARD = Color(0xFF292929);

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Wave',
      theme: ThemeData.dark(),
      home: SpotifyHomePage(),
    );
  }
}

class SpotifyHomePage extends StatelessWidget {
  final List<Map<String, dynamic>> albums = ALL_ALBUMS;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: [
          _buildAlbumGrid(), // Substituindo o CardExample pelo grid
          SectionWidget(
            title: "Álbuns Mais Ouvidos",
            albums: albums,
          ),
          SectionWidget(
            title: "Clássicos",
            albums: albums,
          ),
          SectionWidget(
            title: "Lançados Recentemente",
            albums: albums,
          ),
        ],
      ),
    );
  }

  // Função para construir o grid de álbuns
  Widget _buildAlbumGrid() {
    // Lista de álbuns estáticos
    List<Map<String, dynamic>> albumData = ALL_ALBUMS.take(6).toList();

    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: GridView.builder(
        shrinkWrap: true, // Para não ocupar toda a altura da tela
        physics:
            const NeverScrollableScrollPhysics(), // Impede o scroll do GridView
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2, // 2 colunas
          crossAxisSpacing: 0, // Espaço horizontal entre os itens
          mainAxisSpacing: 0, // Espaço vertical entre os itens
          childAspectRatio: 2 / 0.5, // Razão entre largura e altura
        ),
        itemCount: albumData.length,
        itemBuilder: (context, index) {
          return Card(
            color: GRAY_CARD,
            elevation: 4.0,
            shape: RoundedRectangleBorder(
              borderRadius:
                  BorderRadius.circular(2), // Define o raio dos cantos
            ),
            child: InkWell(
              onTap: () {
                debugPrint('Album tapped: ${albumData[index]["title"]}');
              },
              child: Row(
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(
                          2.0), // Ajuste o valor para o raio desejado
                      bottomLeft: Radius.circular(2.0),
                    ),
                    child: Image.network(
                      albumData[index]["image"],
                      fit: BoxFit.fitHeight,
                    ),
                  ),
                  const SizedBox(width: 8.0), // Ícone representando o álbum
                  Text(
                    albumData[index]["title"]!,
                    style: const TextStyle(
                        fontWeight: FontWeight.bold, color: Colors.white),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}

class SectionWidget extends StatelessWidget {
  final String title;
  final List<Map<String, dynamic>> albums;

  SectionWidget({required this.title, required this.albums});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(title,
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
          const SizedBox(height: 8.0), // Ícone representando o álbum
          Container(
            height: 220,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: albums.length,
              itemBuilder: (context, index) {
                final album = albums[index];
                return AlbumCard(album: album);
              },
            ),
          ),
        ],
      ),
    );
  }
}

class AlbumCard extends StatelessWidget {
  final Map<String, dynamic> album;

  AlbumCard({required this.album});

  @override
  Widget build(BuildContext context) {
    final albumImage = album['image'];
    final albumTitle = album['title'];
    final albumArtists =
        album['artists'].map((artist) => artist['name']).join(", ");

    return Card(
      color: Colors.transparent,
      margin: EdgeInsets.symmetric(horizontal: 8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Image.network(albumImage, width: 150, height: 150, fit: BoxFit.cover),
          const SizedBox(height: 8.0),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(albumTitle,
                  style: TextStyle(
                      fontSize: 16,
                      color: Colors.white,
                      fontWeight: FontWeight.bold)),
              Text(albumArtists, style: TextStyle(color: Colors.grey))
            ],
          )
        ],
      ),
    );
  }
}

final List<Map<String, dynamic>> ALL_ALBUMS = [
  {
    "album_id": "1",
    "title": "GNX",
    "artists": [
      {"artist_id": "1", "name": "Kendrick Lamar"}
    ],
    "genres": ["genre 1"],
    "image":
        "https://a5.mzstatic.com/us/r1000/0/Music211/v4/50/c2/cc/50c2cc95-3658-9417-0d4b-831abde44ba1/24UM1IM28978.rgb.jpg",
    "songs": [
      {
        "song_id": "1",
        "title": "wacced out murals",
        "artists": [
          {"artist_id": "1", "name": "Kendrick Lamar"}
        ],
        "url": "assets/audios/music-2.mp3"
      },
      {
        "song_id": "3",
        "title": "squabble up",
        "artists": [
          {"artist_id": "1", "name": "Kendrick Lamar"}
        ],
        "url": "assets/audios/music-3.mp3"
      },
      {
        "song_id": "4",
        "title": "luther (with sza)",
        "artists": [
          {"artist_id": "1", "name": "Kendrick Lamar"},
          {"artist_id": "3", "name": "SZA"}
        ],
        "url": "assets/audios/music-4.mp3"
      },
      {
        "song_id": "5",
        "title": "man at the garden",
        "artists": [
          {"artist_id": "1", "name": "Kendrick Lamar"}
        ],
        "url": "assets/audios/music-5.mp3"
      },
      {
        "song_id": "6",
        "title": "hey now (featuring dody6)",
        "artists": [
          {"artist_id": "1", "name": "Kendrick Lamar"},
          {"artist_id": "4", "name": "Dody6"}
        ],
        "url": "assets/audios/music-6.mp3"
      },
      {
        "song_id": "7",
        "title": "reincarnated",
        "artists": [
          {"artist_id": "1", "name": "Kendrick Lamar"}
        ],
        "url": "assets/audios/music-7.mp3"
      },
      {
        "song_id": "8",
        "title": "tv off (featuring lefty gunplay)",
        "artists": [
          {"artist_id": "1", "name": "Kendrick Lamar"},
          {"artist_id": "5", "name": "Lefty Gunplay"}
        ],
        "url": "assets/audios/music-8.mp3"
      },
      {
        "song_id": "9",
        "title":
            "dodger blue (featuring wallie the sensei, siete7x, and roddy ricch)",
        "artists": [
          {"artist_id": "1", "name": "Kendrick Lamar"},
          {"artist_id": "6", "name": "Wallie the Sensei"},
          {"artist_id": "7", "name": "Siete7x"},
          {"artist_id": "8", "name": "Roddy Ricch"}
        ],
        "url": "assets/audios/music-9.mp3"
      },
      {
        "song_id": "10",
        "title": "peekaboo (featuring azchike)",
        "artists": [
          {"artist_id": "1", "name": "Kendrick Lamar"},
          {"artist_id": "9", "name": "AzChike"}
        ],
        "url": "assets/audios/music-10.mp3"
      },
      {
        "song_id": "11",
        "title": "heart pt. 6",
        "artists": [
          {"artist_id": "1", "name": "Kendrick Lamar"}
        ],
        "url": "assets/audios/music-11.mp3"
      },
      {
        "song_id": "12",
        "title": "gnx (featuring hitta j3, youngthreat, and peysoh)",
        "artists": [
          {"artist_id": "1", "name": "Kendrick Lamar"},
          {"artist_id": "10", "name": "Hitta J3"},
          {"artist_id": "11", "name": "YoungThreat"},
          {"artist_id": "12", "name": "Peysoh"}
        ],
        "url": "assets/audios/music-12.mp3"
      },
      {
        "song_id": "13",
        "title": "gloria (with sza)",
        "artists": [
          {"artist_id": "1", "name": "Kendrick Lamar"},
          {"artist_id": "3", "name": "SZA"}
        ],
        "url": "assets/audios/music-13.mp3"
      }
    ]
  },
  {
    "album_id": "1",
    "title": "GNX",
    "artists": [
      {"artist_id": "1", "name": "Kendrick Lamar"}
    ],
    "genres": ["genre 1"],
    "image":
        "https://a5.mzstatic.com/us/r1000/0/Music211/v4/50/c2/cc/50c2cc95-3658-9417-0d4b-831abde44ba1/24UM1IM28978.rgb.jpg",
    "songs": [
      {
        "song_id": "1",
        "title": "wacced out murals",
        "artists": [
          {"artist_id": "1", "name": "Kendrick Lamar"}
        ],
        "url": "assets/audios/music-2.mp3"
      },
      {
        "song_id": "3",
        "title": "squabble up",
        "artists": [
          {"artist_id": "1", "name": "Kendrick Lamar"}
        ],
        "url": "assets/audios/music-3.mp3"
      },
      {
        "song_id": "4",
        "title": "luther (with sza)",
        "artists": [
          {"artist_id": "1", "name": "Kendrick Lamar"},
          {"artist_id": "3", "name": "SZA"}
        ],
        "url": "assets/audios/music-4.mp3"
      },
      {
        "song_id": "5",
        "title": "man at the garden",
        "artists": [
          {"artist_id": "1", "name": "Kendrick Lamar"}
        ],
        "url": "assets/audios/music-5.mp3"
      },
      {
        "song_id": "6",
        "title": "hey now (featuring dody6)",
        "artists": [
          {"artist_id": "1", "name": "Kendrick Lamar"},
          {"artist_id": "4", "name": "Dody6"}
        ],
        "url": "assets/audios/music-6.mp3"
      },
      {
        "song_id": "7",
        "title": "reincarnated",
        "artists": [
          {"artist_id": "1", "name": "Kendrick Lamar"}
        ],
        "url": "assets/audios/music-7.mp3"
      },
      {
        "song_id": "8",
        "title": "tv off (featuring lefty gunplay)",
        "artists": [
          {"artist_id": "1", "name": "Kendrick Lamar"},
          {"artist_id": "5", "name": "Lefty Gunplay"}
        ],
        "url": "assets/audios/music-8.mp3"
      },
      {
        "song_id": "9",
        "title":
            "dodger blue (featuring wallie the sensei, siete7x, and roddy ricch)",
        "artists": [
          {"artist_id": "1", "name": "Kendrick Lamar"},
          {"artist_id": "6", "name": "Wallie the Sensei"},
          {"artist_id": "7", "name": "Siete7x"},
          {"artist_id": "8", "name": "Roddy Ricch"}
        ],
        "url": "assets/audios/music-9.mp3"
      },
      {
        "song_id": "10",
        "title": "peekaboo (featuring azchike)",
        "artists": [
          {"artist_id": "1", "name": "Kendrick Lamar"},
          {"artist_id": "9", "name": "AzChike"}
        ],
        "url": "assets/audios/music-10.mp3"
      },
      {
        "song_id": "11",
        "title": "heart pt. 6",
        "artists": [
          {"artist_id": "1", "name": "Kendrick Lamar"}
        ],
        "url": "assets/audios/music-11.mp3"
      },
      {
        "song_id": "12",
        "title": "gnx (featuring hitta j3, youngthreat, and peysoh)",
        "artists": [
          {"artist_id": "1", "name": "Kendrick Lamar"},
          {"artist_id": "10", "name": "Hitta J3"},
          {"artist_id": "11", "name": "YoungThreat"},
          {"artist_id": "12", "name": "Peysoh"}
        ],
        "url": "assets/audios/music-12.mp3"
      },
      {
        "song_id": "13",
        "title": "gloria (with sza)",
        "artists": [
          {"artist_id": "1", "name": "Kendrick Lamar"},
          {"artist_id": "3", "name": "SZA"}
        ],
        "url": "assets/audios/music-13.mp3"
      }
    ]
  },
  {
    "album_id": "1",
    "title": "GNX",
    "artists": [
      {"artist_id": "1", "name": "Kendrick Lamar"}
    ],
    "genres": ["genre 1"],
    "image":
        "https://a5.mzstatic.com/us/r1000/0/Music211/v4/50/c2/cc/50c2cc95-3658-9417-0d4b-831abde44ba1/24UM1IM28978.rgb.jpg",
    "songs": [
      {
        "song_id": "1",
        "title": "wacced out murals",
        "artists": [
          {"artist_id": "1", "name": "Kendrick Lamar"}
        ],
        "url": "assets/audios/music-2.mp3"
      },
      {
        "song_id": "3",
        "title": "squabble up",
        "artists": [
          {"artist_id": "1", "name": "Kendrick Lamar"}
        ],
        "url": "assets/audios/music-3.mp3"
      },
      {
        "song_id": "4",
        "title": "luther (with sza)",
        "artists": [
          {"artist_id": "1", "name": "Kendrick Lamar"},
          {"artist_id": "3", "name": "SZA"}
        ],
        "url": "assets/audios/music-4.mp3"
      },
      {
        "song_id": "5",
        "title": "man at the garden",
        "artists": [
          {"artist_id": "1", "name": "Kendrick Lamar"}
        ],
        "url": "assets/audios/music-5.mp3"
      },
      {
        "song_id": "6",
        "title": "hey now (featuring dody6)",
        "artists": [
          {"artist_id": "1", "name": "Kendrick Lamar"},
          {"artist_id": "4", "name": "Dody6"}
        ],
        "url": "assets/audios/music-6.mp3"
      },
      {
        "song_id": "7",
        "title": "reincarnated",
        "artists": [
          {"artist_id": "1", "name": "Kendrick Lamar"}
        ],
        "url": "assets/audios/music-7.mp3"
      },
      {
        "song_id": "8",
        "title": "tv off (featuring lefty gunplay)",
        "artists": [
          {"artist_id": "1", "name": "Kendrick Lamar"},
          {"artist_id": "5", "name": "Lefty Gunplay"}
        ],
        "url": "assets/audios/music-8.mp3"
      },
      {
        "song_id": "9",
        "title":
            "dodger blue (featuring wallie the sensei, siete7x, and roddy ricch)",
        "artists": [
          {"artist_id": "1", "name": "Kendrick Lamar"},
          {"artist_id": "6", "name": "Wallie the Sensei"},
          {"artist_id": "7", "name": "Siete7x"},
          {"artist_id": "8", "name": "Roddy Ricch"}
        ],
        "url": "assets/audios/music-9.mp3"
      },
      {
        "song_id": "10",
        "title": "peekaboo (featuring azchike)",
        "artists": [
          {"artist_id": "1", "name": "Kendrick Lamar"},
          {"artist_id": "9", "name": "AzChike"}
        ],
        "url": "assets/audios/music-10.mp3"
      },
      {
        "song_id": "11",
        "title": "heart pt. 6",
        "artists": [
          {"artist_id": "1", "name": "Kendrick Lamar"}
        ],
        "url": "assets/audios/music-11.mp3"
      },
      {
        "song_id": "12",
        "title": "gnx (featuring hitta j3, youngthreat, and peysoh)",
        "artists": [
          {"artist_id": "1", "name": "Kendrick Lamar"},
          {"artist_id": "10", "name": "Hitta J3"},
          {"artist_id": "11", "name": "YoungThreat"},
          {"artist_id": "12", "name": "Peysoh"}
        ],
        "url": "assets/audios/music-12.mp3"
      },
      {
        "song_id": "13",
        "title": "gloria (with sza)",
        "artists": [
          {"artist_id": "1", "name": "Kendrick Lamar"},
          {"artist_id": "3", "name": "SZA"}
        ],
        "url": "assets/audios/music-13.mp3"
      }
    ]
  },
  {
    "album_id": "1",
    "title": "GNX",
    "artists": [
      {"artist_id": "1", "name": "Kendrick Lamar"}
    ],
    "genres": ["genre 1"],
    "image":
        "https://a5.mzstatic.com/us/r1000/0/Music211/v4/50/c2/cc/50c2cc95-3658-9417-0d4b-831abde44ba1/24UM1IM28978.rgb.jpg",
    "songs": [
      {
        "song_id": "1",
        "title": "wacced out murals",
        "artists": [
          {"artist_id": "1", "name": "Kendrick Lamar"}
        ],
        "url": "assets/audios/music-2.mp3"
      },
      {
        "song_id": "3",
        "title": "squabble up",
        "artists": [
          {"artist_id": "1", "name": "Kendrick Lamar"}
        ],
        "url": "assets/audios/music-3.mp3"
      },
      {
        "song_id": "4",
        "title": "luther (with sza)",
        "artists": [
          {"artist_id": "1", "name": "Kendrick Lamar"},
          {"artist_id": "3", "name": "SZA"}
        ],
        "url": "assets/audios/music-4.mp3"
      },
      {
        "song_id": "5",
        "title": "man at the garden",
        "artists": [
          {"artist_id": "1", "name": "Kendrick Lamar"}
        ],
        "url": "assets/audios/music-5.mp3"
      },
      {
        "song_id": "6",
        "title": "hey now (featuring dody6)",
        "artists": [
          {"artist_id": "1", "name": "Kendrick Lamar"},
          {"artist_id": "4", "name": "Dody6"}
        ],
        "url": "assets/audios/music-6.mp3"
      },
      {
        "song_id": "7",
        "title": "reincarnated",
        "artists": [
          {"artist_id": "1", "name": "Kendrick Lamar"}
        ],
        "url": "assets/audios/music-7.mp3"
      },
      {
        "song_id": "8",
        "title": "tv off (featuring lefty gunplay)",
        "artists": [
          {"artist_id": "1", "name": "Kendrick Lamar"},
          {"artist_id": "5", "name": "Lefty Gunplay"}
        ],
        "url": "assets/audios/music-8.mp3"
      },
      {
        "song_id": "9",
        "title":
            "dodger blue (featuring wallie the sensei, siete7x, and roddy ricch)",
        "artists": [
          {"artist_id": "1", "name": "Kendrick Lamar"},
          {"artist_id": "6", "name": "Wallie the Sensei"},
          {"artist_id": "7", "name": "Siete7x"},
          {"artist_id": "8", "name": "Roddy Ricch"}
        ],
        "url": "assets/audios/music-9.mp3"
      },
      {
        "song_id": "10",
        "title": "peekaboo (featuring azchike)",
        "artists": [
          {"artist_id": "1", "name": "Kendrick Lamar"},
          {"artist_id": "9", "name": "AzChike"}
        ],
        "url": "assets/audios/music-10.mp3"
      },
      {
        "song_id": "11",
        "title": "heart pt. 6",
        "artists": [
          {"artist_id": "1", "name": "Kendrick Lamar"}
        ],
        "url": "assets/audios/music-11.mp3"
      },
      {
        "song_id": "12",
        "title": "gnx (featuring hitta j3, youngthreat, and peysoh)",
        "artists": [
          {"artist_id": "1", "name": "Kendrick Lamar"},
          {"artist_id": "10", "name": "Hitta J3"},
          {"artist_id": "11", "name": "YoungThreat"},
          {"artist_id": "12", "name": "Peysoh"}
        ],
        "url": "assets/audios/music-12.mp3"
      },
      {
        "song_id": "13",
        "title": "gloria (with sza)",
        "artists": [
          {"artist_id": "1", "name": "Kendrick Lamar"},
          {"artist_id": "3", "name": "SZA"}
        ],
        "url": "assets/audios/music-13.mp3"
      }
    ]
  },
  {
    "album_id": "1",
    "title": "GNX",
    "artists": [
      {"artist_id": "1", "name": "Kendrick Lamar"}
    ],
    "genres": ["genre 1"],
    "image":
        "https://a5.mzstatic.com/us/r1000/0/Music211/v4/50/c2/cc/50c2cc95-3658-9417-0d4b-831abde44ba1/24UM1IM28978.rgb.jpg",
    "songs": [
      {
        "song_id": "1",
        "title": "wacced out murals",
        "artists": [
          {"artist_id": "1", "name": "Kendrick Lamar"}
        ],
        "url": "assets/audios/music-2.mp3"
      },
      {
        "song_id": "3",
        "title": "squabble up",
        "artists": [
          {"artist_id": "1", "name": "Kendrick Lamar"}
        ],
        "url": "assets/audios/music-3.mp3"
      },
      {
        "song_id": "4",
        "title": "luther (with sza)",
        "artists": [
          {"artist_id": "1", "name": "Kendrick Lamar"},
          {"artist_id": "3", "name": "SZA"}
        ],
        "url": "assets/audios/music-4.mp3"
      },
      {
        "song_id": "5",
        "title": "man at the garden",
        "artists": [
          {"artist_id": "1", "name": "Kendrick Lamar"}
        ],
        "url": "assets/audios/music-5.mp3"
      },
      {
        "song_id": "6",
        "title": "hey now (featuring dody6)",
        "artists": [
          {"artist_id": "1", "name": "Kendrick Lamar"},
          {"artist_id": "4", "name": "Dody6"}
        ],
        "url": "assets/audios/music-6.mp3"
      },
      {
        "song_id": "7",
        "title": "reincarnated",
        "artists": [
          {"artist_id": "1", "name": "Kendrick Lamar"}
        ],
        "url": "assets/audios/music-7.mp3"
      },
      {
        "song_id": "8",
        "title": "tv off (featuring lefty gunplay)",
        "artists": [
          {"artist_id": "1", "name": "Kendrick Lamar"},
          {"artist_id": "5", "name": "Lefty Gunplay"}
        ],
        "url": "assets/audios/music-8.mp3"
      },
      {
        "song_id": "9",
        "title":
            "dodger blue (featuring wallie the sensei, siete7x, and roddy ricch)",
        "artists": [
          {"artist_id": "1", "name": "Kendrick Lamar"},
          {"artist_id": "6", "name": "Wallie the Sensei"},
          {"artist_id": "7", "name": "Siete7x"},
          {"artist_id": "8", "name": "Roddy Ricch"}
        ],
        "url": "assets/audios/music-9.mp3"
      },
      {
        "song_id": "10",
        "title": "peekaboo (featuring azchike)",
        "artists": [
          {"artist_id": "1", "name": "Kendrick Lamar"},
          {"artist_id": "9", "name": "AzChike"}
        ],
        "url": "assets/audios/music-10.mp3"
      },
      {
        "song_id": "11",
        "title": "heart pt. 6",
        "artists": [
          {"artist_id": "1", "name": "Kendrick Lamar"}
        ],
        "url": "assets/audios/music-11.mp3"
      },
      {
        "song_id": "12",
        "title": "gnx (featuring hitta j3, youngthreat, and peysoh)",
        "artists": [
          {"artist_id": "1", "name": "Kendrick Lamar"},
          {"artist_id": "10", "name": "Hitta J3"},
          {"artist_id": "11", "name": "YoungThreat"},
          {"artist_id": "12", "name": "Peysoh"}
        ],
        "url": "assets/audios/music-12.mp3"
      },
      {
        "song_id": "13",
        "title": "gloria (with sza)",
        "artists": [
          {"artist_id": "1", "name": "Kendrick Lamar"},
          {"artist_id": "3", "name": "SZA"}
        ],
        "url": "assets/audios/music-13.mp3"
      }
    ]
  },
  {
    "album_id": "1",
    "title": "GNX",
    "artists": [
      {"artist_id": "1", "name": "Kendrick Lamar"}
    ],
    "genres": ["genre 1"],
    "image":
        "https://a5.mzstatic.com/us/r1000/0/Music211/v4/50/c2/cc/50c2cc95-3658-9417-0d4b-831abde44ba1/24UM1IM28978.rgb.jpg",
    "songs": [
      {
        "song_id": "1",
        "title": "wacced out murals",
        "artists": [
          {"artist_id": "1", "name": "Kendrick Lamar"}
        ],
        "url": "assets/audios/music-2.mp3"
      },
      {
        "song_id": "3",
        "title": "squabble up",
        "artists": [
          {"artist_id": "1", "name": "Kendrick Lamar"}
        ],
        "url": "assets/audios/music-3.mp3"
      },
      {
        "song_id": "4",
        "title": "luther (with sza)",
        "artists": [
          {"artist_id": "1", "name": "Kendrick Lamar"},
          {"artist_id": "3", "name": "SZA"}
        ],
        "url": "assets/audios/music-4.mp3"
      },
      {
        "song_id": "5",
        "title": "man at the garden",
        "artists": [
          {"artist_id": "1", "name": "Kendrick Lamar"}
        ],
        "url": "assets/audios/music-5.mp3"
      },
      {
        "song_id": "6",
        "title": "hey now (featuring dody6)",
        "artists": [
          {"artist_id": "1", "name": "Kendrick Lamar"},
          {"artist_id": "4", "name": "Dody6"}
        ],
        "url": "assets/audios/music-6.mp3"
      },
      {
        "song_id": "7",
        "title": "reincarnated",
        "artists": [
          {"artist_id": "1", "name": "Kendrick Lamar"}
        ],
        "url": "assets/audios/music-7.mp3"
      },
      {
        "song_id": "8",
        "title": "tv off (featuring lefty gunplay)",
        "artists": [
          {"artist_id": "1", "name": "Kendrick Lamar"},
          {"artist_id": "5", "name": "Lefty Gunplay"}
        ],
        "url": "assets/audios/music-8.mp3"
      },
      {
        "song_id": "9",
        "title":
            "dodger blue (featuring wallie the sensei, siete7x, and roddy ricch)",
        "artists": [
          {"artist_id": "1", "name": "Kendrick Lamar"},
          {"artist_id": "6", "name": "Wallie the Sensei"},
          {"artist_id": "7", "name": "Siete7x"},
          {"artist_id": "8", "name": "Roddy Ricch"}
        ],
        "url": "assets/audios/music-9.mp3"
      },
      {
        "song_id": "10",
        "title": "peekaboo (featuring azchike)",
        "artists": [
          {"artist_id": "1", "name": "Kendrick Lamar"},
          {"artist_id": "9", "name": "AzChike"}
        ],
        "url": "assets/audios/music-10.mp3"
      },
      {
        "song_id": "11",
        "title": "heart pt. 6",
        "artists": [
          {"artist_id": "1", "name": "Kendrick Lamar"}
        ],
        "url": "assets/audios/music-11.mp3"
      },
      {
        "song_id": "12",
        "title": "gnx (featuring hitta j3, youngthreat, and peysoh)",
        "artists": [
          {"artist_id": "1", "name": "Kendrick Lamar"},
          {"artist_id": "10", "name": "Hitta J3"},
          {"artist_id": "11", "name": "YoungThreat"},
          {"artist_id": "12", "name": "Peysoh"}
        ],
        "url": "assets/audios/music-12.mp3"
      },
      {
        "song_id": "13",
        "title": "gloria (with sza)",
        "artists": [
          {"artist_id": "1", "name": "Kendrick Lamar"},
          {"artist_id": "3", "name": "SZA"}
        ],
        "url": "assets/audios/music-13.mp3"
      }
    ]
  },
  {
    "album_id": "1",
    "title": "GNX",
    "artists": [
      {"artist_id": "1", "name": "Kendrick Lamar"}
    ],
    "genres": ["genre 1"],
    "image":
        "https://a5.mzstatic.com/us/r1000/0/Music211/v4/50/c2/cc/50c2cc95-3658-9417-0d4b-831abde44ba1/24UM1IM28978.rgb.jpg",
    "songs": [
      {
        "song_id": "1",
        "title": "wacced out murals",
        "artists": [
          {"artist_id": "1", "name": "Kendrick Lamar"}
        ],
        "url": "assets/audios/music-2.mp3"
      },
      {
        "song_id": "3",
        "title": "squabble up",
        "artists": [
          {"artist_id": "1", "name": "Kendrick Lamar"}
        ],
        "url": "assets/audios/music-3.mp3"
      },
      {
        "song_id": "4",
        "title": "luther (with sza)",
        "artists": [
          {"artist_id": "1", "name": "Kendrick Lamar"},
          {"artist_id": "3", "name": "SZA"}
        ],
        "url": "assets/audios/music-4.mp3"
      },
      {
        "song_id": "5",
        "title": "man at the garden",
        "artists": [
          {"artist_id": "1", "name": "Kendrick Lamar"}
        ],
        "url": "assets/audios/music-5.mp3"
      },
      {
        "song_id": "6",
        "title": "hey now (featuring dody6)",
        "artists": [
          {"artist_id": "1", "name": "Kendrick Lamar"},
          {"artist_id": "4", "name": "Dody6"}
        ],
        "url": "assets/audios/music-6.mp3"
      },
      {
        "song_id": "7",
        "title": "reincarnated",
        "artists": [
          {"artist_id": "1", "name": "Kendrick Lamar"}
        ],
        "url": "assets/audios/music-7.mp3"
      },
      {
        "song_id": "8",
        "title": "tv off (featuring lefty gunplay)",
        "artists": [
          {"artist_id": "1", "name": "Kendrick Lamar"},
          {"artist_id": "5", "name": "Lefty Gunplay"}
        ],
        "url": "assets/audios/music-8.mp3"
      },
      {
        "song_id": "9",
        "title":
            "dodger blue (featuring wallie the sensei, siete7x, and roddy ricch)",
        "artists": [
          {"artist_id": "1", "name": "Kendrick Lamar"},
          {"artist_id": "6", "name": "Wallie the Sensei"},
          {"artist_id": "7", "name": "Siete7x"},
          {"artist_id": "8", "name": "Roddy Ricch"}
        ],
        "url": "assets/audios/music-9.mp3"
      },
      {
        "song_id": "10",
        "title": "peekaboo (featuring azchike)",
        "artists": [
          {"artist_id": "1", "name": "Kendrick Lamar"},
          {"artist_id": "9", "name": "AzChike"}
        ],
        "url": "assets/audios/music-10.mp3"
      },
      {
        "song_id": "11",
        "title": "heart pt. 6",
        "artists": [
          {"artist_id": "1", "name": "Kendrick Lamar"}
        ],
        "url": "assets/audios/music-11.mp3"
      },
      {
        "song_id": "12",
        "title": "gnx (featuring hitta j3, youngthreat, and peysoh)",
        "artists": [
          {"artist_id": "1", "name": "Kendrick Lamar"},
          {"artist_id": "10", "name": "Hitta J3"},
          {"artist_id": "11", "name": "YoungThreat"},
          {"artist_id": "12", "name": "Peysoh"}
        ],
        "url": "assets/audios/music-12.mp3"
      },
      {
        "song_id": "13",
        "title": "gloria (with sza)",
        "artists": [
          {"artist_id": "1", "name": "Kendrick Lamar"},
          {"artist_id": "3", "name": "SZA"}
        ],
        "url": "assets/audios/music-13.mp3"
      }
    ]
  },
  {
    "album_id": "1",
    "title": "GNX",
    "artists": [
      {"artist_id": "1", "name": "Kendrick Lamar"}
    ],
    "genres": ["genre 1"],
    "image":
        "https://a5.mzstatic.com/us/r1000/0/Music211/v4/50/c2/cc/50c2cc95-3658-9417-0d4b-831abde44ba1/24UM1IM28978.rgb.jpg",
    "songs": [
      {
        "song_id": "1",
        "title": "wacced out murals",
        "artists": [
          {"artist_id": "1", "name": "Kendrick Lamar"}
        ],
        "url": "assets/audios/music-2.mp3"
      },
      {
        "song_id": "3",
        "title": "squabble up",
        "artists": [
          {"artist_id": "1", "name": "Kendrick Lamar"}
        ],
        "url": "assets/audios/music-3.mp3"
      },
      {
        "song_id": "4",
        "title": "luther (with sza)",
        "artists": [
          {"artist_id": "1", "name": "Kendrick Lamar"},
          {"artist_id": "3", "name": "SZA"}
        ],
        "url": "assets/audios/music-4.mp3"
      },
      {
        "song_id": "5",
        "title": "man at the garden",
        "artists": [
          {"artist_id": "1", "name": "Kendrick Lamar"}
        ],
        "url": "assets/audios/music-5.mp3"
      },
      {
        "song_id": "6",
        "title": "hey now (featuring dody6)",
        "artists": [
          {"artist_id": "1", "name": "Kendrick Lamar"},
          {"artist_id": "4", "name": "Dody6"}
        ],
        "url": "assets/audios/music-6.mp3"
      },
      {
        "song_id": "7",
        "title": "reincarnated",
        "artists": [
          {"artist_id": "1", "name": "Kendrick Lamar"}
        ],
        "url": "assets/audios/music-7.mp3"
      },
      {
        "song_id": "8",
        "title": "tv off (featuring lefty gunplay)",
        "artists": [
          {"artist_id": "1", "name": "Kendrick Lamar"},
          {"artist_id": "5", "name": "Lefty Gunplay"}
        ],
        "url": "assets/audios/music-8.mp3"
      },
      {
        "song_id": "9",
        "title":
            "dodger blue (featuring wallie the sensei, siete7x, and roddy ricch)",
        "artists": [
          {"artist_id": "1", "name": "Kendrick Lamar"},
          {"artist_id": "6", "name": "Wallie the Sensei"},
          {"artist_id": "7", "name": "Siete7x"},
          {"artist_id": "8", "name": "Roddy Ricch"}
        ],
        "url": "assets/audios/music-9.mp3"
      },
      {
        "song_id": "10",
        "title": "peekaboo (featuring azchike)",
        "artists": [
          {"artist_id": "1", "name": "Kendrick Lamar"},
          {"artist_id": "9", "name": "AzChike"}
        ],
        "url": "assets/audios/music-10.mp3"
      },
      {
        "song_id": "11",
        "title": "heart pt. 6",
        "artists": [
          {"artist_id": "1", "name": "Kendrick Lamar"}
        ],
        "url": "assets/audios/music-11.mp3"
      },
      {
        "song_id": "12",
        "title": "gnx (featuring hitta j3, youngthreat, and peysoh)",
        "artists": [
          {"artist_id": "1", "name": "Kendrick Lamar"},
          {"artist_id": "10", "name": "Hitta J3"},
          {"artist_id": "11", "name": "YoungThreat"},
          {"artist_id": "12", "name": "Peysoh"}
        ],
        "url": "assets/audios/music-12.mp3"
      },
      {
        "song_id": "13",
        "title": "gloria (with sza)",
        "artists": [
          {"artist_id": "1", "name": "Kendrick Lamar"},
          {"artist_id": "3", "name": "SZA"}
        ],
        "url": "assets/audios/music-13.mp3"
      }
    ]
  },
  {
    "album_id": "1",
    "title": "GNX",
    "artists": [
      {"artist_id": "1", "name": "Kendrick Lamar"}
    ],
    "genres": ["genre 1"],
    "image":
        "https://a5.mzstatic.com/us/r1000/0/Music211/v4/50/c2/cc/50c2cc95-3658-9417-0d4b-831abde44ba1/24UM1IM28978.rgb.jpg",
    "songs": [
      {
        "song_id": "1",
        "title": "wacced out murals",
        "artists": [
          {"artist_id": "1", "name": "Kendrick Lamar"}
        ],
        "url": "assets/audios/music-2.mp3"
      },
      {
        "song_id": "3",
        "title": "squabble up",
        "artists": [
          {"artist_id": "1", "name": "Kendrick Lamar"}
        ],
        "url": "assets/audios/music-3.mp3"
      },
      {
        "song_id": "4",
        "title": "luther (with sza)",
        "artists": [
          {"artist_id": "1", "name": "Kendrick Lamar"},
          {"artist_id": "3", "name": "SZA"}
        ],
        "url": "assets/audios/music-4.mp3"
      },
      {
        "song_id": "5",
        "title": "man at the garden",
        "artists": [
          {"artist_id": "1", "name": "Kendrick Lamar"}
        ],
        "url": "assets/audios/music-5.mp3"
      },
      {
        "song_id": "6",
        "title": "hey now (featuring dody6)",
        "artists": [
          {"artist_id": "1", "name": "Kendrick Lamar"},
          {"artist_id": "4", "name": "Dody6"}
        ],
        "url": "assets/audios/music-6.mp3"
      },
      {
        "song_id": "7",
        "title": "reincarnated",
        "artists": [
          {"artist_id": "1", "name": "Kendrick Lamar"}
        ],
        "url": "assets/audios/music-7.mp3"
      },
      {
        "song_id": "8",
        "title": "tv off (featuring lefty gunplay)",
        "artists": [
          {"artist_id": "1", "name": "Kendrick Lamar"},
          {"artist_id": "5", "name": "Lefty Gunplay"}
        ],
        "url": "assets/audios/music-8.mp3"
      },
      {
        "song_id": "9",
        "title":
            "dodger blue (featuring wallie the sensei, siete7x, and roddy ricch)",
        "artists": [
          {"artist_id": "1", "name": "Kendrick Lamar"},
          {"artist_id": "6", "name": "Wallie the Sensei"},
          {"artist_id": "7", "name": "Siete7x"},
          {"artist_id": "8", "name": "Roddy Ricch"}
        ],
        "url": "assets/audios/music-9.mp3"
      },
      {
        "song_id": "10",
        "title": "peekaboo (featuring azchike)",
        "artists": [
          {"artist_id": "1", "name": "Kendrick Lamar"},
          {"artist_id": "9", "name": "AzChike"}
        ],
        "url": "assets/audios/music-10.mp3"
      },
      {
        "song_id": "11",
        "title": "heart pt. 6",
        "artists": [
          {"artist_id": "1", "name": "Kendrick Lamar"}
        ],
        "url": "assets/audios/music-11.mp3"
      },
      {
        "song_id": "12",
        "title": "gnx (featuring hitta j3, youngthreat, and peysoh)",
        "artists": [
          {"artist_id": "1", "name": "Kendrick Lamar"},
          {"artist_id": "10", "name": "Hitta J3"},
          {"artist_id": "11", "name": "YoungThreat"},
          {"artist_id": "12", "name": "Peysoh"}
        ],
        "url": "assets/audios/music-12.mp3"
      },
      {
        "song_id": "13",
        "title": "gloria (with sza)",
        "artists": [
          {"artist_id": "1", "name": "Kendrick Lamar"},
          {"artist_id": "3", "name": "SZA"}
        ],
        "url": "assets/audios/music-13.mp3"
      }
    ]
  },
  {
    "album_id": "1",
    "title": "GNX",
    "artists": [
      {"artist_id": "1", "name": "Kendrick Lamar"}
    ],
    "genres": ["genre 1"],
    "image":
        "https://a5.mzstatic.com/us/r1000/0/Music211/v4/50/c2/cc/50c2cc95-3658-9417-0d4b-831abde44ba1/24UM1IM28978.rgb.jpg",
    "songs": [
      {
        "song_id": "1",
        "title": "wacced out murals",
        "artists": [
          {"artist_id": "1", "name": "Kendrick Lamar"}
        ],
        "url": "assets/audios/music-2.mp3"
      },
      {
        "song_id": "3",
        "title": "squabble up",
        "artists": [
          {"artist_id": "1", "name": "Kendrick Lamar"}
        ],
        "url": "assets/audios/music-3.mp3"
      },
      {
        "song_id": "4",
        "title": "luther (with sza)",
        "artists": [
          {"artist_id": "1", "name": "Kendrick Lamar"},
          {"artist_id": "3", "name": "SZA"}
        ],
        "url": "assets/audios/music-4.mp3"
      },
      {
        "song_id": "5",
        "title": "man at the garden",
        "artists": [
          {"artist_id": "1", "name": "Kendrick Lamar"}
        ],
        "url": "assets/audios/music-5.mp3"
      },
      {
        "song_id": "6",
        "title": "hey now (featuring dody6)",
        "artists": [
          {"artist_id": "1", "name": "Kendrick Lamar"},
          {"artist_id": "4", "name": "Dody6"}
        ],
        "url": "assets/audios/music-6.mp3"
      },
      {
        "song_id": "7",
        "title": "reincarnated",
        "artists": [
          {"artist_id": "1", "name": "Kendrick Lamar"}
        ],
        "url": "assets/audios/music-7.mp3"
      },
      {
        "song_id": "8",
        "title": "tv off (featuring lefty gunplay)",
        "artists": [
          {"artist_id": "1", "name": "Kendrick Lamar"},
          {"artist_id": "5", "name": "Lefty Gunplay"}
        ],
        "url": "assets/audios/music-8.mp3"
      },
      {
        "song_id": "9",
        "title":
            "dodger blue (featuring wallie the sensei, siete7x, and roddy ricch)",
        "artists": [
          {"artist_id": "1", "name": "Kendrick Lamar"},
          {"artist_id": "6", "name": "Wallie the Sensei"},
          {"artist_id": "7", "name": "Siete7x"},
          {"artist_id": "8", "name": "Roddy Ricch"}
        ],
        "url": "assets/audios/music-9.mp3"
      },
      {
        "song_id": "10",
        "title": "peekaboo (featuring azchike)",
        "artists": [
          {"artist_id": "1", "name": "Kendrick Lamar"},
          {"artist_id": "9", "name": "AzChike"}
        ],
        "url": "assets/audios/music-10.mp3"
      },
      {
        "song_id": "11",
        "title": "heart pt. 6",
        "artists": [
          {"artist_id": "1", "name": "Kendrick Lamar"}
        ],
        "url": "assets/audios/music-11.mp3"
      },
      {
        "song_id": "12",
        "title": "gnx (featuring hitta j3, youngthreat, and peysoh)",
        "artists": [
          {"artist_id": "1", "name": "Kendrick Lamar"},
          {"artist_id": "10", "name": "Hitta J3"},
          {"artist_id": "11", "name": "YoungThreat"},
          {"artist_id": "12", "name": "Peysoh"}
        ],
        "url": "assets/audios/music-12.mp3"
      },
      {
        "song_id": "13",
        "title": "gloria (with sza)",
        "artists": [
          {"artist_id": "1", "name": "Kendrick Lamar"},
          {"artist_id": "3", "name": "SZA"}
        ],
        "url": "assets/audios/music-13.mp3"
      }
    ]
  },
];
