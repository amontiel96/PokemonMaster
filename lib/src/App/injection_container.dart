import 'package:get_it/get_it.dart';
import 'package:http/http.dart' as http;
import 'package:poke_app/src/App/Features/Home/data/datasources/pokemon_remote_datasource.dart';

import 'package:poke_app/src/App/Features/Home/data/repositories/pokemon_repository_impl.dart';

import 'package:poke_app/src/App/Features/Home/domain/repositories/pokemon_repository.dart';
import 'package:poke_app/src/App/Features/Home/domain/useCases/get_pokemon_species.dart';

import 'package:poke_app/src/App/Features/Home/domain/useCases/get_pokemons.dart';

import 'package:poke_app/src/App/Features/Home/presentation/cubit/pokemon_cubit.dart';
import 'package:poke_app/src/App/Features/Home/presentation/cubit/pokemon_detail_cubit.dart';
import 'package:poke_app/src/App/Features/Home/presentation/cubit/pokemon_species_cubit.dart';

import 'Features/Home/domain/useCases/get_pokemon_detail.dart';

final sl = GetIt.instance;

void init() {
  //inyector global de toda la app
  // Registrar el cliente HTTP
  sl.registerLazySingleton<http.Client>(() => http.Client());

  sl.registerLazySingleton<PokemonRemoteDataSource>(
    () => PokemonRemoteDataSourceImpl(client: sl()),
  );

  // Repositories
  sl.registerLazySingleton<PokemonRepository>(
    () => PokemonRepositoryImpl(remoteDataSource: sl()),
  );

  // UseCases
  sl.registerLazySingleton<PokemonApiService>(
    () => PokemonApiService(client: sl()),
  );

  // Cubit
  sl.registerFactory(() => PokemonCubit(getPokemons: sl()));

  // UseCases
  sl.registerLazySingleton<PokemonDetailApiService>(
    () => PokemonDetailApiService(client: sl()),
  );

  // Cubit
  sl.registerFactory(() => PokemonDetailCubit(apiService: sl()));

  // UseCases
  sl.registerLazySingleton<PokemonSpeciesApiService>(
    () => PokemonSpeciesApiService(client: sl()),
  );

  // Cubit
  sl.registerFactory(() => PokemonSpeciesCubit(apiService: sl()));
}
