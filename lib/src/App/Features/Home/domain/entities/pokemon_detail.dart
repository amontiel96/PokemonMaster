import 'package:poke_app/src/App/Features/Home/data/models/pokemon_stat_model.dart';

class PokemonDetail {
  final int id;
  final String name;
  final int height;
  final int weight;
  final List<String> types;
  final List<String> moves;
  final List<StatModel> stats;

  PokemonDetail({
    required this.id,
    required this.name,
    required this.height,
    required this.weight,
    required this.types,
    required this.moves,
    required this.stats,
  });
}


