import 'package:poke_app/src/App/Features/Home/data/models/pokemon_species_model.dart';

class PokemonSpeciesState {}

class PokemonSpeciesLoading extends PokemonSpeciesState {}

class PokemonSpeciesError extends PokemonSpeciesState {
  final String message;

  PokemonSpeciesError({required this.message});
}

class PokemonSpeciesLoaded extends PokemonSpeciesState {
  final PokemonSpeciesModel species;

  PokemonSpeciesLoaded({required this.species});
}
