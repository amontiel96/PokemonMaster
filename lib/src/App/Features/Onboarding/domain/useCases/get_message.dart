// lib/features/hello/domain/usecases/get_message.dart
import 'package:dartz/dartz.dart';
import '../entities/message.dart';
import '../repositories/message_repository.dart';

class GetMessage {
  final MessageRepository repository;

  GetMessage(this.repository);

  Future<Either<Exception, Message>> call() async {
    return await repository.getMessage();
  }
}
