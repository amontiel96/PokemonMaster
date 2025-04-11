import 'package:core_module/features/storage/data/repositories/storage_preference_impl.dart';
import 'package:get_it/get_it.dart';
import 'package:http/http.dart' as http;
import 'package:poke_app/src/App/Features/Home/data/datasources/pokemon_remote_datasource.dart';

import 'package:poke_app/src/App/Features/Home/data/repositories/pokemon_repository_impl.dart';

import 'package:poke_app/src/App/Features/Home/domain/repositories/pokemon_repository.dart';
import 'package:poke_app/src/App/Features/Home/domain/useCases/get_pokemon_species.dart';

import 'package:poke_app/src/App/Features/Home/domain/useCases/get_pokemons.dart';
import 'package:poke_app/src/App/Features/Home/presentation/cubit/home_main_cubit.dart';

import 'package:poke_app/src/App/Features/Home/presentation/cubit/pokemon_cubit.dart';
import 'package:poke_app/src/App/Features/Home/presentation/cubit/pokemon_detail_cubit.dart';
import 'package:poke_app/src/App/Features/Home/presentation/cubit/pokemon_species_cubit.dart';
import 'package:poke_app/src/App/Features/SingUp/presentation/cubit/singup_cubit.dart';

import 'Features/Home/domain/useCases/get_pokemon_detail.dart';
import 'Features/Login/presentation/cubit/login_cubit.dart';

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
  sl.registerLazySingleton<GetPokemonCase>(() => GetPokemonCase(sl()));

  // Cubit
  sl.registerFactory(() => PokemonCubit(getPokemonCase: sl()));
  sl.registerFactory(() => SignupCubit());
  sl.registerFactory(() => LoginCubit());
  sl.registerFactory(() => HomeMainCubit());

  // UseCases
  sl.registerLazySingleton<GetPokemonDetail>(() => GetPokemonDetail(sl()));

  // Cubit
  sl.registerFactory(() => PokemonDetailCubit(useCase: sl()));

  // UseCases
  sl.registerLazySingleton<GetPokemonSpecies>(() => GetPokemonSpecies(sl()));

  // Cubit
  sl.registerFactory(() => PokemonSpeciesCubit(useCase: sl()));
  sl.registerLazySingleton<StoragePreferencesImpl>(
    () => StoragePreferencesImpl(),
  );
}
