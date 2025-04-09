import 'package:dartz/dartz.dart';
import 'package:poke_app/src/App/Core/errors/failures.dart';
import 'package:poke_app/src/App/Features/Home/data/datasources/pokemon_remote_datasource.dart';
import 'package:poke_app/src/App/Features/Home/data/models/pokemon_model.dart';
import 'package:poke_app/src/App/Features/Home/domain/repositories/pokemon_repository.dart';

class PokemonRepositoryImpl implements PokemonRepository {
  final PokemonRemoteDataSource remoteDataSource;

  PokemonRepositoryImpl({required this.remoteDataSource});

  @override
  Future<Either<Failure, List<PokemonModel>>> getPokemons(String url) async {
    try {
      final pokemons = await remoteDataSource.getPokemons(url);
      return Right(pokemons);
    } catch (e) {
      return Left(ApiFailure(message: 'Failed to load Pokemons'));
    }
  }
}
