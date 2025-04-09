import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:poke_app/src/App/Features/Home/data/models/pokemon_model.dart';

abstract class PokemonRemoteDataSource {
  Future<List<PokemonModel>> getPokemons(String url);
}

class PokemonRemoteDataSourceImpl implements PokemonRemoteDataSource {
  final http.Client client;

  PokemonRemoteDataSourceImpl({required this.client});

  @override
  Future<List<PokemonModel>> getPokemons(String url) async {
    final response = await client.get(Uri.parse(url));

    if (response.statusCode == 200) {
      final data = json.decode(response.body);
      final List<dynamic> results = data['results'];
      return results
          .map((pokemonJson) => PokemonModel.fromJson(pokemonJson))
          .toList();
    } else {
      throw Exception('Failed to load Pokemons');
    }
  }
}
