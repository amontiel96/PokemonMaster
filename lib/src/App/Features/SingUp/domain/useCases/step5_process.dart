import 'package:core_module/core_module.dart';
import 'package:poke_app/src/AtomicModel-UI/module_ui.dart';

class UserInformationCase {
  bool btnContinue = false;

  final email = TextEditingController();
  final pass = TextEditingController();
  final passConfirm = TextEditingController();
  final username = TextEditingController();

  String emailError = '';
  String passError = '';
  String passConfirmError = '';
  List<Map<String, dynamic>> dataRules = [];
  bool showPassword = false;
  bool showPasswordConfirm = false;

  bool tycIsCheck = false;

  bool isComplete = false;
  bool showTimer = true;

  bool isSaveTemUser = false;
  bool isSaveUser = false;

  void validationStep5() {
    btnContinue = true;

    if (
    username.text.trim().isEmpty ||
        email.text.trim().isEmpty ||
        pass.text.trim().isEmpty ||
        passConfirm.text.trim().isEmpty) {
      btnContinue = false;
    }
  }

  void emailValidation() {
    validationStep5();
    emailError = '';

    if (!FormatterUtils.isValidEmail(email.text.trim())) {
      emailError = 'Formato de email no valido';
      btnContinue = false;
    }
  }

  void verifyPassword(bool isValid) {
    validationStep5();
    passConfirmError = '';
    passConfirm.clear();
    passError = '';
    if (!isValid) {
      passError = 'La contraseña no cumple con las especificaciones';
      btnContinue = false;
    }
  }

  void passwordConfirm() {
    validationStep5();
    passConfirmError = '';
    if (pass.text.trim() != passConfirm.text.trim()) {
      passConfirmError = 'la contraseña no coincide';
      btnContinue = false;
    }
  }
}