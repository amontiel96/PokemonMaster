import 'dart:convert';

import 'package:http/http.dart';
import 'package:poke_app/src/App/Core/constants/global_constants.dart';

import '../../data/models/pokemon_species_model.dart';

class PokemonSpeciesApiService {
  final Client client;

  PokemonSpeciesApiService({required this.client});

  Future<PokemonSpeciesModel> getPokemonSpeciesDetails(int speciesId) async {
    final response = await client.get(
      Uri.parse('${AppConstants.home.apiSpeciesPokemon}$speciesId'),
    );

    if (response.statusCode == 200) {
      final data = json.decode(response.body);
      return PokemonSpeciesModel.fromJson(data);
    } else {
      throw Exception('Failed to load Pokemon species details');
    }
  }
}
