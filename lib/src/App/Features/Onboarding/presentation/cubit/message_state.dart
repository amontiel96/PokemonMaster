part of 'message_cubit.dart';

abstract class MessageState {}

class MessageInitial extends MessageState {}

class MessageLoading extends MessageState {}

class MessageLoaded extends MessageState {
  final Message message;

  MessageLoaded(this.message);
}

class MessageError extends MessageState {
  final String message;

  MessageError(this.message);
}
