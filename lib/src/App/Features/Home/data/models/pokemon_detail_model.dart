class PokemonDetailModel {
  final int id;
  final String name;
  final int height;
  final int weight;
  final List<String> types;
  final List<String> moves;
  final List<Stat> stats;

  PokemonDetailModel({
    required this.id,
    required this.name,
    required this.height,
    required this.weight,
    required this.types,
    required this.moves,
    required this.stats,
  });

  factory PokemonDetailModel.fromJson(Map<String, dynamic> json) {
    return PokemonDetailModel(
      id: json['id'],
      name: json['name'],
      height: json['height'],
      weight: json['weight'],
      types: List<String>.from(
        json['types'].map((type) => type['type']['name']),
      ),
      moves: List<String>.from(
        json['moves'].map((move) => move['move']['name']),
      ),
      stats:
          (json['stats'] as List).map((stat) => Stat.fromJson(stat)).toList(),
    );
  }
}

class Stat {
  final String name;
  final int baseStat;

  Stat({required this.name, required this.baseStat});

  factory Stat.fromJson(Map<String, dynamic> json) {
    return Stat(name: json['stat']['name'], baseStat: json['base_stat']);
  }
}
