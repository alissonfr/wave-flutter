import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:wave_flutter/app/models/dto/home_section.dart';
import 'package:wave_flutter/app/models/entities/album.dart';
import 'package:wave_flutter/app/modules/home/widgets/section_widget.dart';
import 'package:wave_flutter/app/service/album_service.dart';

class HomePage extends StatelessWidget {
  final AlbumService albumService = AlbumService();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder(
        future: Future.wait([
          albumService.getHomeInfo(),
          albumService.getRecentlyListened(),
        ]),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return const Center(child: Text('Erro ao carregar dados'));
          } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
            return const Center(child: Text('Nenhum item encontrado'));
          } else {
            final List<HomeSectionDTO> homeInfo =
                snapshot.data?[0] as List<HomeSectionDTO>;
            final List<Album> recentlyListenedAlbums =
                snapshot.data?[1] as List<Album>;

            return SingleChildScrollView(
              child: Column(
                children: [
                  _buildAlbumGrid(context, recentlyListenedAlbums),
                  ListView.builder(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    itemCount: homeInfo.length,
                    itemBuilder: (context, index) {
                      return SectionWidget(
                        title: homeInfo[index].title,
                        albums: homeInfo[index].albums,
                      );
                    },
                  ),
                ],
              ),
            );
          }
        },
      ),
    );
  }

  Widget _buildAlbumGrid(BuildContext context, List<Album> albums) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: GridView.builder(
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          childAspectRatio: 2 / 0.5,
        ),
        itemCount: albums.length,
        itemBuilder: (context, index) {
          return Card(
            color: const Color(0xFF292929),
            elevation: 4.0,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(8),
            ),
            child: InkWell(
              onTap: () {
                context.push('/details/${albums[index].albumId}');
              },
              child: Row(
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(2),
                    child: Image.network(
                      albums[index].images.lowQuality,
                      fit: BoxFit.fitHeight,
                      height: double.infinity,
                      // width: 100,
                    ),
                  ),
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.only(left: 8.0, right: 8.0),
                      child: Text(
                        albums[index].title,
                        style: const TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
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
