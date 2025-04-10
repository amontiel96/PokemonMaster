import 'package:flutter_modular/flutter_modular.dart';
import 'package:poke_app/src/App/Features/Home/domain/useCases/get_pokemon_detail.dart';
import 'package:poke_app/src/App/Features/Home/domain/useCases/get_pokemon_species.dart';
import 'package:poke_app/src/App/Features/Home/domain/useCases/get_pokemons.dart';
import 'package:poke_app/src/App/Features/Home/presentation/cubit/pokemon_cubit.dart';
import 'package:poke_app/src/App/Features/Home/presentation/cubit/pokemon_detail_cubit.dart';
import 'package:poke_app/src/App/Features/Home/presentation/cubit/pokemon_species_cubit.dart';
import 'package:poke_app/src/App/Features/Home/presentation/pages/detail_page.dart';

import 'package:poke_app/src/App/injection_container.dart';
import 'presentation/cubit/home_main_cubit.dart';
import 'presentation/pages/home_page.dart';

class HomeModule extends Module {
  @override
  void binds(Injector i) {
    i.addSingleton<PokemonCubit>(() => PokemonCubit(getPokemonCase: sl<GetPokemonCase>()));
    i.addSingleton<PokemonDetailCubit>(() => PokemonDetailCubit(useCase: sl<GetPokemonDetail>()));
    i.addSingleton<PokemonSpeciesCubit>(() => PokemonSpeciesCubit(useCase: sl<GetPokemonSpecies>()));
    i.addSingleton<HomeMainCubit>(() => HomeMainCubit());
  }

  @override
  void routes(RouteManager r) {
    r.child('/', child: (context) => HomePage());
    r.child('/detail', child: (context) => DetailPage());
  }
}
