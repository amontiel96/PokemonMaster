import 'package:dartz/dartz.dart';
import 'package:poke_app/src/App/Core/errors/failures.dart';
import 'package:poke_app/src/App/Features/Home/domain/repositories/pokemon_repository.dart';

import '../../data/models/pokemon_species_model.dart';

class GetPokemonSpecies {
  final PokemonRepository repository;

  GetPokemonSpecies(this.repository);

  Future<Either<Failure, PokemonSpeciesModel>> getPokemonSpecies(int speciesId) async {
    return await repository.getSpeciesPokemon(speciesId);
  }
}
