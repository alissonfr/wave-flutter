import 'package:flutter/material.dart';

import 'pages/home_page.dart';

class HomeModule extends StatefulWidget {
  const HomeModule({Key? key}) : super(key: key);

  @override
  State<HomeModule> createState() => _HomeModuleState();
}

class _HomeModuleState extends State<HomeModule> {
  @override
  Widget build(BuildContext context) {
    return HomePage();
  }
}
