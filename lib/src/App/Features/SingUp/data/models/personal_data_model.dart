

import 'package:poke_app/src/App/Features/SingUp/domain/entities/personal_data.dart';

class PersonalDataModel extends PersonalData {
  PersonalDataModel({
    super.username,
    super.email,
    super.password,
  });

  // Método para convertir el objeto a JSON
  Map<String, dynamic> toJson() {
    return {
      'username': username,
      'email': email,
      'password': password,
    };
  }

  // Método para crear una instancia desde un JSON
  factory PersonalDataModel.fromJson(Map<String, dynamic> json) {
    return PersonalDataModel(
        username: json['username'],
        email: json['email'],
        password: json['password'],
        );
  }

  PersonalDataModel updateValues({
    String? username,
    String? email,
    String? password,
  }) {
    return PersonalDataModel(
        username: username ?? this.username,
        email: email ?? this.email,
        password: password ?? this.password,
    );
  }
}
