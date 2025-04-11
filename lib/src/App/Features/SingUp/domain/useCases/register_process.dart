import 'package:core_module/core_module.dart';
import 'package:poke_app/src/App/Core/constants/global_constants.dart';
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

  void validationVerify() {
    btnContinue = true;

    if (username.text.trim().isEmpty ||
        email.text.trim().isEmpty ||
        pass.text.trim().isEmpty ||
        passConfirm.text.trim().isEmpty) {
      btnContinue = false;
    }
  }

  void emailValidation() {
    validationVerify();
    emailError = '';

    if (!FormatterUtils.isValidEmail(email.text.trim())) {
      emailError = AppConstants.signup.errorFormatEmail;
      btnContinue = false;
    }
  }

  void verifyPassword(bool isValid) {
    validationVerify();
    passConfirmError = '';
    passConfirm.clear();
    passError = '';
    if (!isValid) {
      passError = AppConstants.signup.errorPassword;
      btnContinue = false;
    }
  }

  void passwordConfirm() {
    validationVerify();
    passConfirmError = '';
    if (pass.text.trim() != passConfirm.text.trim()) {
      passConfirmError = AppConstants.signup.diferentPass;
      btnContinue = false;
    }
  }
}
