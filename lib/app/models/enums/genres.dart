enum GenresEnum {
  ALL,
  HIP_HOP,
  ROCK;

  String get label {
    switch (this) {
      case GenresEnum.ALL:
        return "Tudo";
      case GenresEnum.HIP_HOP:
        return "Hip-hop";
      case GenresEnum.ROCK:
        return "Rock";
    }
  }

  static GenresEnum fromValue(String value) {
    return GenresEnum.values.firstWhere(
      (category) => category.name.toUpperCase() == value.toUpperCase(),
      orElse: () => GenresEnum.ALL,
    );
  }
}
