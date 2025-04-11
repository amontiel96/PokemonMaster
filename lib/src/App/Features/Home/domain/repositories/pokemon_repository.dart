import 'package:dartz/dartz.dart';
import 'package:poke_app/src/App/Core/errors/failures.dart';
import 'package:poke_app/src/App/Features/Home/data/models/pokemon_detail_model.dart';
import 'package:poke_app/src/App/Features/Home/data/models/pokemon_response_model.dart';
import 'package:poke_app/src/App/Features/Home/data/models/pokemon_species_model.dart';

abstract class PokemonRepository {
  Future<Either<Failure, PokemonResponse>> getAllPokemon(String url);

  Future<Either<Failure, PokemonDetailModel>> getDetailPokemon(int pokemonId);

  Future<Either<Failure, PokemonSpeciesModel>> getSpeciesPokemon(int speciesId);
}
