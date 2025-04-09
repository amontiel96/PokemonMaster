import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:poke_app/src/App/Features/Home/data/models/pokemon_detail_model.dart';
import 'package:poke_app/src/App/Features/Home/domain/useCases/get_pokemon_detail.dart';

class PokemonDetailCubit extends Cubit<PokemonDetailState> {
  final PokemonDetailApiService apiService;

  PokemonDetailCubit({required this.apiService}) : super(PokemonLoading());

  Future<void> fetchPokemonDetails(int pokemonId) async {
    try {
      final response = await apiService.getPokemonDetails(pokemonId);
      emit(PokemonLoaded(pokemon: response));
    } catch (e) {
      emit(PokemonError(message: 'Failed to load Pokemon details'));
    }
  }
}

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
