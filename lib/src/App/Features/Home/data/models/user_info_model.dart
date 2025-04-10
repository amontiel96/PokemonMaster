import 'dart:convert';

import 'package:poke_app/src/App/Features/Home/domain/entities/user_info.dart';

class UserAccountModel extends UserAccount {
  UserAccountModel({
    required super.username,
    required super.email,
    required super.password,
  });

  // Métodos para convertir el JSON en un objeto de tipo PokemonModel
  factory UserAccountModel.fromJson(Map<String, dynamic> json) {
    return UserAccountModel(
      username: json['username'],
      email: json['email'],
      password: json['password'],
    );
  }
}
