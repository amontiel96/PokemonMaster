import 'package:dartz/dartz.dart';
import 'package:poke_app/src/App/Core/errors/failures.dart';
import 'package:poke_app/src/App/Features/Home/data/models/pokemon_response_model.dart';
import 'package:poke_app/src/App/Features/Home/domain/repositories/pokemon_repository.dart';

class GetPokemonCase {
  final PokemonRepository repository;

  GetPokemonCase(this.repository);

  Future<Either<Failure, PokemonResponse>> execute({
    required String url,
  }) async {
    return await repository.getAllPokemon(url);
  }
}
