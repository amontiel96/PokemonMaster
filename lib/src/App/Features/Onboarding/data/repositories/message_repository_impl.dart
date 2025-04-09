// lib/features/hello/data/repositories/message_repository_impl.dart
import 'package:dartz/dartz.dart';
import '../../domain/entities/message.dart';
import '../../domain/repositories/message_repository.dart';
import '../models/message_model.dart';

class MessageRepositoryImpl implements MessageRepository {
  @override
  Future<Either<Exception, Message>> getMessage() async {
    try {
      // Aquí puedes hacer la llamada a una API, base de datos, etc.
      final message = MessageModel("Hola Mundo ams");
      return Right(message);
    } catch (e) {
      return Left(Exception('Error al obtener el mensaje'));
    }
  }
}
