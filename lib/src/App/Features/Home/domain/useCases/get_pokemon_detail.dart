import 'dart:convert';

import 'package:http/http.dart';
import 'package:poke_app/src/App/Core/constants/global_constants.dart';
import 'package:poke_app/src/App/Features/Home/data/models/pokemon_detail_model.dart';

class PokemonDetailApiService {
  final Client client;

  PokemonDetailApiService({required this.client});

  Future<PokemonDetailModel> getPokemonDetails(int pokemonId) async {
    final response = await client.get(
      Uri.parse('${AppConstants.home.apiPokemon}$pokemonId/'),
    );

    if (response.statusCode == 200) {
      final data = json.decode(response.body);
      return PokemonDetailModel.fromJson(data);
    } else {
      throw Exception('Failed to load Pokemon details');
    }
  }
}
