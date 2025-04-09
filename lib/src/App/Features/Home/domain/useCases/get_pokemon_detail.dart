
import 'package:dartz/dartz.dart';
import 'package:poke_app/src/App/Core/errors/failures.dart';
import 'package:poke_app/src/App/Features/Home/data/models/pokemon_detail_model.dart';
import 'package:poke_app/src/App/Features/Home/domain/repositories/pokemon_repository.dart';

class GetPokemonDetail {
  final PokemonRepository repository;

  GetPokemonDetail(this.repository);

  Future<Either<Failure, PokemonDetailModel>> getPokemonDetails({
    required int pokemonId
  }) async {
    return await repository.getDetailPokemon(pokemonId);
  }
}
