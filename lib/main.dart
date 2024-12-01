import 'package:flutter/material.dart';
import 'package:wave_flutter/app/modules/details/details_module.dart';
import 'package:wave_flutter/app/modules/home/home_module.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Wave',
      theme: ThemeData.dark(),
      initialRoute: '/home',
      routes: {
        '/home': (context) => HomeModule(),
        '/album-details': (context) => DetailsModule(),
      },
    );
  }
}
