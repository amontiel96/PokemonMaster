import 'package:poke_app/src/App/Features/Home/data/models/pokemon_model.dart';

class PokemonResponse {
  final List<PokemonModel> pokemons;
  final String nextUrl;
  final int count;

  PokemonResponse({
    required this.pokemons,
    required this.nextUrl,
    required this.count,
  });
}