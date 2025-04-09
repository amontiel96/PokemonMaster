import 'package:poke_app/src/App/Features/Home/data/models/pokemon_model.dart';

class PokemonState {}

class PokemonLoading extends PokemonState {}

class PokemonLoaded extends PokemonState {
  final List<PokemonModel> pokemons;
  final String nextUrl;
  final int count;
  final String id;

  PokemonLoaded({
    required this.pokemons,
    required this.nextUrl,
    required this.count,
    required this.id,
  });
}

class PokemonError extends PokemonState {
  final String message;

  PokemonError({required this.message});
}