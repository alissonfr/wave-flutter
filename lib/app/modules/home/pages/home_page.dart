import 'package:flutter/material.dart';
import 'package:wave_flutter/app/models/dto/home_section.dart';
import 'package:wave_flutter/app/models/entities/album.dart';
import 'package:wave_flutter/app/modules/home/widgets/album_grid_widget.dart';
import 'package:wave_flutter/app/modules/home/widgets/section_widget.dart';
import 'package:wave_flutter/app/modules/home/widgets/user_header_widget.dart';
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
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  const UserHeaderWidget(),
                  AlbumGridWidget(albums: recentlyListenedAlbums),
                  ListView.builder(
                    padding: EdgeInsets.only(top: 36.0),
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
}
