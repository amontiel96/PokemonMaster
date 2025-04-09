class PokemonSpeciesModel {
  final int id;
  final String name;
  final List<String> flavorTexts;

  PokemonSpeciesModel({
    required this.id,
    required this.name,
    required this.flavorTexts,
  });

  factory PokemonSpeciesModel.fromJson(Map<String, dynamic> json) {
    return PokemonSpeciesModel(
      id: json['id'],
      name: json['name'],
      flavorTexts:
          (json['flavor_text_entries'] as List)
              .map((entry) => entry['flavor_text'] as String)
              .toList(),
    );
  }
}
