

import 'package:poke_app/src/App/Features/Onboarding/domain/entities/message.dart';
import 'package:poke_app/src/App/Features/Onboarding/domain/useCases/get_message.dart';
import 'package:poke_app/src/AtomicModel-UI/module_ui.dart';

part 'message_state.dart';

class MessageCubit extends Cubit<MessageState> {
  final GetMessage getMessage;

  MessageCubit(this.getMessage) : super(MessageInitial());

  Future<void> fetchMessage() async {
    emit(MessageLoading());
    final failureOrMessage = await getMessage();
    failureOrMessage.fold(
          (failure) => emit(MessageError('Error al cargar el mensaje')),
          (message) => emit(MessageLoaded(message)),
    );
  }
}
