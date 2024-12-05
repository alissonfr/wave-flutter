import 'package:flutter/material.dart';
import 'package:wave_flutter/app/modules/search/pages/search_page.dart';

class SearchModule extends StatefulWidget {
  const SearchModule({Key? key}) : super(key: key);

  @override
  State<SearchModule> createState() => _SearchModuleState();
}

class _SearchModuleState extends State<SearchModule> {
  @override
  Widget build(BuildContext context) {
    return SearchPage();
  }
}
