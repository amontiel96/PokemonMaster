
import 'package:poke_app/src/App/Features/Home/domain/entities/pokemon_data.dart';

class PokemonModel extends PokemonData {
  PokemonModel({required super.name, required super.url});

  // Métodos para convertir el JSON en un objeto de tipo PokemonModel
  factory PokemonModel.fromJson(Map<String, dynamic> json) {
    return PokemonModel(name: json['name'], url: json['url']);
  }
}
