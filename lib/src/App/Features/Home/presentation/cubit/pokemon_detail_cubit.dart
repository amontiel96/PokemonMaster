import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:poke_app/src/App/Features/Home/domain/useCases/get_pokemon_detail.dart';
import 'package:poke_app/src/App/Features/Home/presentation/cubit/state/pokemon_detail_state.dart';

class PokemonDetailCubit extends Cubit<PokemonDetailState> {
  final GetPokemonDetail useCase;

  PokemonDetailCubit({required this.useCase}) : super(PokemonLoading());

  Future<void> fetchPokemonDetails(int pokemonId) async {
    try {
      final result = await useCase.getPokemonDetails(pokemonId: pokemonId);

      result.fold((failure) => emit(PokemonError(message: failure.message)), (
        response,
      ) {
        emit(PokemonLoaded(pokemon: response));
      });
    } catch (e) {
      emit(PokemonError(message: 'Failed to load Pokemon details'));
    }
  }
}
