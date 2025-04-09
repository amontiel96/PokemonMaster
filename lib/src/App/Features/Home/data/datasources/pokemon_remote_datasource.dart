import 'dart:convert';
import 'package:dartz/dartz.dart';
import 'package:http/http.dart' as http;
import 'package:poke_app/src/App/Features/Home/data/models/pokemon_model.dart';
import 'package:poke_app/src/App/Features/Home/data/models/pokemon_response_model.dart';
import '../../../../Core/errors/failures.dart';

abstract class PokemonRemoteDataSource {
  Future<Either<Failure, PokemonResponse>> getPokemons(String url);
}

class PokemonRemoteDataSourceImpl implements PokemonRemoteDataSource {
  final http.Client client;

  PokemonRemoteDataSourceImpl({required this.client});

  @override
  Future<Either<Failure, PokemonResponse>> getPokemons(String url) async {
    try {
      final response = await client.get(Uri.parse(url));

      if (response.statusCode == 200) {
        final data = json.decode(response.body);
        final List<dynamic> results = data['results'];
        final nextUrl =
            data['next'] ?? ''; // Tomamos la URL de la siguiente página
        final count = data['count'] ?? 0;

        // Mapeamos los resultados de los Pokémon a una lista de objetos PokemonModel
        final pokemons =
            results
                .map((pokemonJson) => PokemonModel.fromJson(pokemonJson))
                .toList();

        // Devolvemos un objeto PokemonResponse que contiene los pokemons y la URL 'next'
        return Right(
          PokemonResponse(pokemons: pokemons, nextUrl: nextUrl, count: count),
        );
      } else {
        return Left(Failure(message: 'Failed to load Pokemons'));
      }
    } catch (e) {
      return Left(Failure(message: 'Failed to load Pokemons'));
    }
  }
}
