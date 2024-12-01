class AlbumService {
  static List<Map<String, dynamic>> getAlbums() {
    return ALL_ALBUMS;
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
