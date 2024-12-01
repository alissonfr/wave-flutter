import 'package:flutter/material.dart';

class DetailsPage extends StatelessWidget {
  final String id;

  const DetailsPage({Key? key, required this.id}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("album.title")),
      body: Center(
        child: Column(
          children: [
            //Image.network(album.image),
            Text("album.title", style: TextStyle(fontSize: 24)),
          ],
        ),
      ),
    );
  }
}
