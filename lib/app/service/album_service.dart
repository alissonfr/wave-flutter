class AlbumService {
  static List<Album> getAlbums() {
    return [
      ...allAlbums,
      ...allAlbums,
      ...allAlbums,
      ...allAlbums,
      ...allAlbums,
      ...allAlbums,
      ...allAlbums,
      ...allAlbums,
      ...allAlbums,
      ...allAlbums,
      ...allAlbums,
      ...allAlbums,
      ...allAlbums,
      ...allAlbums,
      ...allAlbums
    ];
  }
}

class Album {
  final String albumId;
  final String title;
  final List<Artist> artists;
  final List<Genre> genres;
  final String image;
  final List<Song> songs;

  Album({
    required this.albumId,
    required this.title,
    required this.artists,
    required this.genres,
    required this.image,
    required this.songs,
  });
}

class Artist {
  final String artistId;
  final String name;

  Artist({
    required this.artistId,
    required this.name,
  });
}

class Genre {
  final String genreId;
  final String name;

  Genre({
    required this.genreId,
    required this.name,
  });
}

class Song {
  final String songId;
  final String title;
  final List<Artist> artists;
  final String url;

  Song({
    required this.songId,
    required this.title,
    required this.artists,
    required this.url,
  });
}

final List<Album> allAlbums = [
  Album(
    albumId: "1",
    title: "GNX",
    artists: [
      Artist(artistId: "1", name: "Kendrick Lamar"),
    ],
    genres: [
      Genre(genreId: "1", name: "genre 1"),
    ],
    image:
        "https://a5.mzstatic.com/us/r1000/0/Music211/v4/50/c2/cc/50c2cc95-3658-9417-0d4b-831abde44ba1/24UM1IM28978.rgb.jpg",
    songs: [
      Song(
        songId: "1",
        title: "wacced out murals",
        artists: [
          Artist(artistId: "1", name: "Kendrick Lamar"),
        ],
        url: "assets/audios/music-2.mp3",
      ),
      Song(
        songId: "3",
        title: "squabble up",
        artists: [
          Artist(artistId: "1", name: "Kendrick Lamar"),
        ],
        url: "assets/audios/music-3.mp3",
      ),
      Song(
        songId: "4",
        title: "luther (with sza)",
        artists: [
          Artist(artistId: "1", name: "Kendrick Lamar"),
          Artist(artistId: "3", name: "SZA"),
        ],
        url: "assets/audios/music-4.mp3",
      ),
      Song(
        songId: "5",
        title: "man at the garden",
        artists: [
          Artist(artistId: "1", name: "Kendrick Lamar"),
        ],
        url: "assets/audios/music-5.mp3",
      ),
      Song(
        songId: "6",
        title: "hey now (featuring dody6)",
        artists: [
          Artist(artistId: "1", name: "Kendrick Lamar"),
          Artist(artistId: "4", name: "Dody6"),
        ],
        url: "assets/audios/music-6.mp3",
      ),
      Song(
        songId: "7",
        title: "reincarnated",
        artists: [
          Artist(artistId: "1", name: "Kendrick Lamar"),
        ],
        url: "assets/audios/music-7.mp3",
      ),
      Song(
        songId: "8",
        title: "tv off (featuring lefty gunplay)",
        artists: [
          Artist(artistId: "1", name: "Kendrick Lamar"),
          Artist(artistId: "5", name: "Lefty Gunplay"),
        ],
        url: "assets/audios/music-8.mp3",
      ),
      Song(
        songId: "9",
        title:
            "dodger blue (featuring wallie the sensei, siete7x, and roddy ricch)",
        artists: [
          Artist(artistId: "1", name: "Kendrick Lamar"),
          Artist(artistId: "6", name: "Wallie the Sensei"),
          Artist(artistId: "7", name: "Siete7x"),
          Artist(artistId: "8", name: "Roddy Ricch"),
        ],
        url: "assets/audios/music-9.mp3",
      ),
      Song(
        songId: "10",
        title: "peekaboo (featuring azchike)",
        artists: [
          Artist(artistId: "1", name: "Kendrick Lamar"),
          Artist(artistId: "9", name: "AzChike"),
        ],
        url: "assets/audios/music-10.mp3",
      ),
      Song(
        songId: "11",
        title: "heart pt. 6",
        artists: [
          Artist(artistId: "1", name: "Kendrick Lamar"),
        ],
        url: "assets/audios/music-11.mp3",
      ),
      Song(
        songId: "12",
        title: "gnx (featuring hitta j3, youngthreat, and peysoh)",
        artists: [
          Artist(artistId: "1", name: "Kendrick Lamar"),
          Artist(artistId: "10", name: "Hitta J3"),
          Artist(artistId: "11", name: "YoungThreat"),
          Artist(artistId: "12", name: "Peysoh"),
        ],
        url: "assets/audios/music-12.mp3",
      ),
      Song(
        songId: "13",
        title: "gloria (with sza)",
        artists: [
          Artist(artistId: "1", name: "Kendrick Lamar"),
          Artist(artistId: "3", name: "SZA"),
        ],
        url: "assets/audios/music-13.mp3",
      ),
    ],
  ),
];
