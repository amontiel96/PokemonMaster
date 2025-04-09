
import 'package:dartz/dartz.dart';
import 'package:poke_app/src/App/Features/Onboarding/domain/entities/message.dart';



abstract class MessageRepository {
  Future<Either<Exception, Message>> getMessage();
}
