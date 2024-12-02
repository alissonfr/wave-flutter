import 'package:flutter/material.dart';
import 'package:wave_flutter/app/models/entities/album.dart';
import 'package:wave_flutter/app/service/album_service.dart';

class DetailsPage extends StatelessWidget {
  final AlbumService albumService = AlbumService();
  final String id;

  DetailsPage({Key? key, required this.id}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: albumService.getById(id),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(child: CircularProgressIndicator());
        } else if (snapshot.hasError) {
          print(snapshot);
          return const Center(child: Text('Erro ao carregar dados'));
        } else if (!snapshot.hasData || snapshot.data == null) {
          return const Center(child: Text('Nenhum item encontrado'));
        } else {
          final Album album = snapshot.data as Album;

          return Scaffold(
            appBar: AppBar(title: Text(album.title)),
            body: Center(
              child: Column(
                children: [
                  Image.network(album.images.highQuality),
                  Text(album.title, style: TextStyle(fontSize: 24)),
                ],
              ),
            ),
          );
        }
      },
    );
  }
}
