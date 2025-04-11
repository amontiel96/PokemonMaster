import 'package:poke_app/src/App/Features/Home/data/models/pokemon_stat_model.dart';
import 'package:poke_app/src/App/Features/Home/domain/entities/pokemon_detail.dart';

class PokemonDetailModel extends PokemonDetail {
  PokemonDetailModel({
    required super.id,
    required super.name,
    required super.height,
    required super.weight,
    required super.types,
    required super.moves,
    required super.stats,
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
          (json['stats'] as List)
              .map((stat) => StatModel.fromJson(stat))
              .toList(),
    );
  }
}
