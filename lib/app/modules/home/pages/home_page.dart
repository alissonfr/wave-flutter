import 'package:flutter/material.dart';
import 'package:wave_flutter/app/modules/home/widgets/section_widget.dart';
import 'package:wave_flutter/app/service/album_service.dart';

class HomePage extends StatelessWidget {
  final List<Map<String, dynamic>> albums = AlbumService.getAlbums();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: [
          _buildAlbumGrid(context),
          SectionWidget(title: "Álbuns Mais Ouvidos", albums: albums),
          SectionWidget(title: "Clássicos", albums: albums),
          SectionWidget(title: "Lançados Recentemente", albums: albums),
        ],
      ),
    );
  }

  Widget _buildAlbumGrid(BuildContext context) {
    final albumData = albums.take(6).toList();

    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: GridView.builder(
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          crossAxisSpacing: 0,
          mainAxisSpacing: 0,
          childAspectRatio: 2 / 0.5,
        ),
        itemCount: albumData.length,
        itemBuilder: (context, index) {
          return Card(
            color: Color(0xFF292929),
            elevation: 4.0,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(2),
            ),
            child: InkWell(
              onTap: () {
                Navigator.pushNamed(context, '/album-details',
                    arguments: albumData[index]);
              },
              child: Row(
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(2),
                    child: Image.network(
                      albumData[index]["image"],
                      fit: BoxFit.fitHeight,
                    ),
                  ),
                  const SizedBox(width: 8.0),
                  Text(
                    albumData[index]["title"],
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
