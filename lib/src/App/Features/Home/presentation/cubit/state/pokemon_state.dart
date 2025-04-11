import 'package:poke_app/src/App/Features/Home/data/models/pokemon_model.dart';

class PokemonState {}

class PokemonLoading extends PokemonState {}

class PokemonLoaded extends PokemonState {
  final List<PokemonModel> pokemons;
  final List<PokemonModel> filteredPokemons;
  final String nextUrl;

  final int count;
  final String id;

  PokemonLoaded({
    required this.pokemons,
    required this.filteredPokemons,
    required this.nextUrl,
    required this.count,
    required this.id,
  });

  PokemonLoaded copyWith({
    List<PokemonModel>? pokemons,
    List<PokemonModel>? filteredPokemons,
    String? nextUrl,
    int? count,
    String? id,
  }) {
    return PokemonLoaded(
      pokemons: pokemons ?? this.pokemons,
      filteredPokemons: filteredPokemons ?? this.filteredPokemons,
      nextUrl: nextUrl ?? this.nextUrl,
      count: count ?? this.count,
      id: id ?? this.id,
    );
  }
}

class PokemonError extends PokemonState {
  final String message;
  PokemonError({required this.message});
}
