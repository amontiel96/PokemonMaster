import 'dart:ui';

import 'package:poke_app/src/App/Core/constants/global_constants.dart';

class CoreUtils {
  // Función para obtener el color de fondo basado en los tipos de un Pokémon
  static Color getPokemonBackgroundColor(String pokemon) {
    String color = '#ffffff'; // Color por defecto (blanco)
    color = AppConstants.home.typeColors[pokemon] ?? color;

    // Si el string tiene un '#', lo eliminamos
    if (color.startsWith('#')) {
      color = color.substring(1);
    }

    // Convertimos el string hexadecimal en un valor entero

    return Color(int.parse('0xFF' + color));
  }

  static String getId(url){
    // Usamos split() para separar la URL por el carácter '/'
    List<String> parts = url.split('/');

    // El número final estará en la última posición de la lista
    String number = parts[parts.length - 2]; // El número está antes del último '/'
    return number;
  }
}
