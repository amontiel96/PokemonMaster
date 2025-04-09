import 'package:poke_app/src/App/Features/Home/domain/entities/pokemon_stat.dart';

class StatModel extends Stat {
  StatModel({required super.name, required super.baseStat});

  factory StatModel.fromJson(Map<String, dynamic> json) {
    return StatModel(name: json['stat']['name'], baseStat: json['base_stat']);
  }

}