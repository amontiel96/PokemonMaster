import 'package:poke_app/src/App/Features/Home/domain/entities/pokemon_species.dart';

class PokemonSpeciesModel extends PokemonSpecies {
  PokemonSpeciesModel({
    required super.id,
    required super.name,
    required super.flavorTexts,
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
