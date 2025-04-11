import 'package:poke_app/src/App/Features/Home/data/models/pokemon_detail_model.dart';

class PokemonDetailState {}

class PokemonLoading extends PokemonDetailState {}

class PokemonError extends PokemonDetailState {
  final String message;

  PokemonError({required this.message});
}

class PokemonLoaded extends PokemonDetailState {
  final PokemonDetailModel pokemon;

  PokemonLoaded({required this.pokemon});
}
