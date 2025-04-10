import 'package:poke_app/src/App/Core/constants/module/login.dart';

import 'module/home.dart';
import 'module/onboarding.dart';

class AppConstants{
  // Evitar la instanciación de la clase
  AppConstants._();

  // Definir las constantes de cada modulo
  static String appName = "PokeApp";
  static HomeConstants home = HomeConstants();
  static OnboardingConstants onboarding = OnboardingConstants();
  static LoginConstants login = LoginConstants();
}