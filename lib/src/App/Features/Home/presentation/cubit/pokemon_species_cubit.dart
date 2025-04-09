import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:poke_app/src/App/Features/Home/presentation/cubit/state/pokemon_species_state.dart';
import '../../domain/useCases/get_pokemon_species.dart';

class PokemonSpeciesCubit extends Cubit<PokemonSpeciesState> {
  final GetPokemonSpecies apiService;

  PokemonSpeciesCubit({required this.apiService})
    : super(PokemonSpeciesLoading());

  Future<void> fetchPokemonSpeciesDetails(int speciesId) async {
    try {
      final result = await apiService.getPokemonSpecies(speciesId);

      result.fold(
        (failure) => emit(PokemonSpeciesError(message: failure.message)),
        (response) {
          emit(PokemonSpeciesLoaded(species: response));
        },
      );
    } catch (e) {
      emit(
        PokemonSpeciesError(message: 'Failed to load Pokemon species details'),
      );
    }
  }
}
