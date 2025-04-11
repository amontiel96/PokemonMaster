import 'package:core_module/core_module.dart';
import 'package:poke_app/src/AtomicModel-UI/module_ui.dart';

part 'state/login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  LoginCubit() : super(PreLoginInitial());

  final email = TextEditingController();
  final pass = TextEditingController();

  bool isEnabledBtnInit = false;
  String emailError = '';
  final int minTimeout = 1;

  bool loginError = false;
  String msgError = '';

  final prefs = StorageCoreService.instance.prefs;

  void errorLogin(msg) {
    loginError = true;
    msgError = msg;
    emit(PreLoginError());
  }

  void validCurrentUser() async {
    String newUser = FirebaseService.instance.getUser()!.uid ?? '';
    String currentUser =
        prefs.getValue(key: 'userid', type: StorageDataType.string) ?? '';
    if (currentUser.isNotEmpty) {
      if (currentUser != newUser) {
        prefs.clear();
      }
    }
    await prefs.write(
      key: 'userid',
      value: FirebaseService.instance.getUser()!.uid ?? '',
    );
  }

  void initScreen() {
    loginError = false;
    emit(PreLoginInitial());
  }

  void changeViewPassword() {
    emit(PreLoginRedirectRegisterScreen());
  }

  void signIn() async {
    try {
      emit(PreLoginLoading());
      await FirebaseService.instance.signOut();
      Map<String, dynamic> result = await FirebaseService.instance.signIn(
        email.text.toString().trim(),
        pass.text.toString().trim(),
      );
      bool isSuccess = result['success'];
      String error = result['error'] ?? '';
      bool isEmailValid = false;

      emit(
        PreLoginLoaded(
          isSuccess: isSuccess,
          isEmailValid: isEmailValid,
          errorMessage: error,
        ),
      );
    } catch (e) {
      emit(
        PreLoginLoaded(
          isSuccess: false,
          isEmailValid: false,
          errorMessage: '!Ocurrio un error¡',
        ),
      );
    }
  }

  void emailValidation() {
    emailError = '';
    validInputs();

    if (!FormatterUtils.isValidEmail(email.text.trim())) {
      emailError = 'Correo no valido';
      isEnabledBtnInit = false;
    }
    emit(PreLoginEmailValidation());
  }

  void validInputs() {
    isEnabledBtnInit = true;
    if (email.text.trim().isEmpty || pass.text.trim().isEmpty) {
      isEnabledBtnInit = false;
    }
    emit(PreLoginEmailValidation());
  }
}
