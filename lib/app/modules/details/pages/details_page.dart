import 'package:flutter/material.dart';

class DetailsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final album =
        ModalRoute.of(context)!.settings.arguments as Map<String, dynamic>;

    return Scaffold(
      appBar: AppBar(title: Text(album["title"])),
      body: Center(
        child: Column(
          children: [
            Image.network(album["image"]),
            Text(album["title"], style: TextStyle(fontSize: 24)),
          ],
        ),
      ),
    );
  }
}
