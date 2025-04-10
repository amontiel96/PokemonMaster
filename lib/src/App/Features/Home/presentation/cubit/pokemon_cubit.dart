import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:poke_app/src/App/Core/utils/utils.dart';
import 'package:poke_app/src/App/Features/Home/domain/useCases/get_pokemons.dart';
import 'package:poke_app/src/App/Features/Home/presentation/cubit/state/pokemon_state.dart';



class PokemonCubit extends Cubit<PokemonState> {
  //final GetPokemons getPokemons;
  final GetPokemonCase getPokemonCase;

  PokemonCubit({required this.getPokemonCase}) : super(PokemonLoading());

  Future<void> fetchPokemons(String url) async {
    final result = await getPokemonCase.execute(url: url);

    result.fold((failure) => emit(PokemonError(message: failure.message)), (
      response,
    ) {
      // response contiene la lista de pokemons y la siguiente URL para paginar
      emit(
        PokemonLoaded(
          pokemons: response.pokemons,
          filteredPokemons: response.pokemons,
          nextUrl: response.nextUrl,
          count: response.count,
          id: CoreUtils.getId(response.nextUrl),
        ),
      );
    });
  }

  Future<void> loadMorePokemons(String nextUrl) async {
    final result = await getPokemonCase.execute(url: nextUrl);

    result.fold((failure) => emit(PokemonError(message: failure.message)), (
      response,
    ) {
      if (state is PokemonLoaded) {
        final currentState = state as PokemonLoaded;
        // Concatenar los nuevos Pokémon con los existentes
        emit(
          PokemonLoaded(
            pokemons: currentState.pokemons + response.pokemons,
            filteredPokemons: currentState.pokemons + response.pokemons,
            nextUrl: response.nextUrl,
            count: response.count,
            id: CoreUtils.getId(response.nextUrl),
          ),
        );
      }
    });
  }

  void filterPokemons(String query) {
    final currentState = state;

    if (currentState is PokemonLoaded) {
      final filtered = currentState.pokemons
          .where((p) => p.name.toLowerCase().contains(query.toLowerCase()))
          .toList();

      emit(currentState.copyWith(filteredPokemons: filtered));
    }
  }

}
