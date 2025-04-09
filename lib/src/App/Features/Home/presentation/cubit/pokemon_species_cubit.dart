import 'package:flutter_bloc/flutter_bloc.dart';

import '../../data/models/pokemon_species_model.dart';
import '../../domain/useCases/get_pokemon_species.dart';

class PokemonSpeciesCubit extends Cubit<PokemonSpeciesState> {
  final PokemonSpeciesApiService apiService;

  PokemonSpeciesCubit({required this.apiService}) : super(PokemonSpeciesLoading());

  Future<void> fetchPokemonSpeciesDetails(int speciesId) async {
    try {
      final response = await apiService.getPokemonSpeciesDetails(speciesId);
      emit(PokemonSpeciesLoaded(species: response));
    } catch (e) {
      emit(PokemonSpeciesError(message: 'Failed to load Pokemon species details'));
    }
  }
}

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
