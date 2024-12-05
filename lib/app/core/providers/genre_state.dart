import 'package:flutter/foundation.dart';
import 'package:wave_flutter/app/models/enums/genres.dart';

class GenreState extends ChangeNotifier {
  GenresEnum _selectedGenre = GenresEnum.ALL;

  GenresEnum get selectedGenre => _selectedGenre;

  void setGenre(GenresEnum genre) {
    _selectedGenre = genre;
    notifyListeners();
  }
}
