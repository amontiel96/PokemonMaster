import 'package:core_module/features/storage/service/storage_service.dart';
import 'package:poke_app/src/App/Core/utils/utils.dart';
import 'package:poke_app/src/App/Features/Home/domain/entities/pokemon_data.dart';

class PokemonModel extends PokemonData {
  PokemonModel({
    required super.name,
    required super.url,
    required super.favorite,
  });

  // Métodos para convertir el JSON en un objeto de tipo PokemonModel
  factory PokemonModel.fromJson(Map<String, dynamic> json) {
    final prefs = StorageCoreService.instance.prefs;
    return PokemonModel(
      name: json['name'],
      url: json['url'],
      favorite:
          json['favorite'] ??
          prefs.getValue(
            key: '${CoreUtils.getId(json['url']).trim()}#${json['name']}',
            type: StorageDataType.bool,
          ) ??
          false,
    );
  }

  PokemonModel updateValues({bool? favorite}) {
    return PokemonModel(
      favorite: favorite ?? this.favorite,
      name: this.name,
      url: this.url,
    );
  }
}
