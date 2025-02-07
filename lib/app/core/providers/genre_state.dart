import 'package:flutter/foundation.dart';
import 'package:wave_flutter/app/models/entities/genre.dart';

class GenreState extends ChangeNotifier {
  Genre? _selectedGenre;

  Genre? get selectedGenre => _selectedGenre;

  void setGenre(Genre genre) {
    _selectedGenre = genre;
    notifyListeners();
  }

  void resetGenre() {
    _selectedGenre = null;
    notifyListeners();
  }
}
