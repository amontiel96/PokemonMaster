// Clase base Failure para manejar errores generales
class Failure {
  final String message;

  Failure({required this.message});
}

// Error de red específico, por ejemplo, si no se puede conectar con la API
class NetworkFailure extends Failure {
  NetworkFailure({required String message}) : super(message: message);
}

// Error de API, cuando la respuesta de la API es inválida o tiene errores
class ApiFailure extends Failure {
  ApiFailure({required String message}) : super(message: message);
}

// Error genérico, para otros tipos de fallos
class GenericFailure extends Failure {
  GenericFailure({required String message}) : super(message: message);
}
