import 'package:flutter/material.dart';
import 'package:wave_flutter/app/shared/pages/details/pages/details_page.dart';

class DetailsModule extends StatelessWidget {
  final id;

  const DetailsModule({Key? key, required this.id}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DetailsPage(id: id);
  }
}
