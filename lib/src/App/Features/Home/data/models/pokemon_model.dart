class DataPokemon {
  final int count;
  final String next;
  final String? previous;
  final List<PokemonModel> results;

  DataPokemon({
    required this.count,
    required this.next,
    required this.previous,
    required this.results,
  });

  factory DataPokemon.fromJson(Map<String, dynamic> json) {
    final List<dynamic> results = json['results'];
    final listPoke =
        results
            .map((pokemonJson) => PokemonModel.fromJson(pokemonJson))
            .toList();
    return DataPokemon(
      count: json['count'],
      next: json['next'],
      previous: json['previous'],
      results: listPoke,
    );
  }
}

class PokemonModel {
  final String name;
  final String url;

  PokemonModel({required this.name, required this.url});

  // Métodos para convertir el JSON en un objeto de tipo PokemonModel
  factory PokemonModel.fromJson(Map<String, dynamic> json) {
    return PokemonModel(name: json['name'], url: json['url']);
  }
}
