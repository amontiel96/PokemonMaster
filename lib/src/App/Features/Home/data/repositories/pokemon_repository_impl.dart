import 'package:dartz/dartz.dart';
import 'package:poke_app/src/App/Core/errors/failures.dart';
import 'package:poke_app/src/App/Features/Home/data/datasources/pokemon_remote_datasource.dart';
import 'package:poke_app/src/App/Features/Home/data/models/pokemon_detail_model.dart';
import 'package:poke_app/src/App/Features/Home/data/models/pokemon_response_model.dart';
import 'package:poke_app/src/App/Features/Home/domain/repositories/pokemon_repository.dart';

class PokemonRepositoryImpl implements PokemonRepository {
  final PokemonRemoteDataSource remoteDataSource;

  PokemonRepositoryImpl({required this.remoteDataSource});

  @override
  Future<Either<Failure, PokemonResponse>> getAllPokemon(String url) async {
    try {
      final pokemons = await remoteDataSource.getPokemons(url);
      return pokemons;
    } catch (e) {
      return Left(Failure(message: 'Failed to load Pokemons'));
    }
  }

  @override
  Future<Either<Failure, PokemonDetailModel>> getDetailPokemon(int pokemonId) async {
    try {
      final pokemons = await remoteDataSource.getDetailPokemon(pokemonId);
      return pokemons;
    } catch (e) {
      return Left(Failure(message: 'Failed to load Pokemons'));
    }
  }
}
