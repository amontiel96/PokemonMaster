import 'package:core_module/core_module.dart';
import 'package:poke_app/src/App/Features/SingUp/data/models/personal_data_model.dart';
import 'package:poke_app/src/App/Features/SingUp/domain/useCases/step5_process.dart';
import 'package:poke_app/src/AtomicModel-UI/module_ui.dart';

part 'state/singup_state.dart';

class SignupCubit extends Cubit<SignupState> {
  SignupCubit() : super(SignupInitial());
  UserInformationCase uInfo = UserInformationCase();

  PersonalDataModel personalDataModel = PersonalDataModel();

  final prefs = StorageCoreService.instance.prefs;

  bool createError = false;

  void initScreen() {
    uInfo = UserInformationCase();
    personalDataModel = PersonalDataModel();
    createError =false;
    emit(SignupInitial());
  }


  void errorCreateUser(){
    createError = true;
    emit(SignupError());
  }

  void onBackToSignup() {
    emit(SignupOnBackSignup());
  }

  void SignupShow() {
    emit(SignupShowState());
  }

  void changeViewPassword() {
    emit(SignupStep4Validation());
  }

  void step5ValidationEvent() {
    uInfo.validationStep5();
    emit(SignupStep5Validation());
  }

  void step5EmailValidationEvent() {
    uInfo.emailValidation();
    emit(SignupStep5Validation());
  }

  void validUserName() {
    uInfo.validationStep5();
    emit(SignupStep5Validation());
  }

  void verifyPasswordEvent({required bool isValid}) {
    uInfo.verifyPassword(isValid);
    emit(SignupStep5Validation());
  }

  void confirmPasswordEvent() {
    uInfo.passwordConfirm();
    emit(SignupStep5Validation());
  }

  void verifyRegister() {
    emit(SignupStep5Validation());
  }

  void createUser({required Function(bool, String) onResult}) async {
    final result = await FirebaseService.instance.signUp(
      uInfo.email.text.trim(),
      uInfo.pass.text.trim(),
    );
    result.fold(
      (exception) {
        // Aquí manejas la excepción
        print('amsdev Error: $exception');
        onResult(false, exception.toString());
      },
      (user) async {
        // Aquí manejas el caso exitoso (user no será null si el registro fue exitoso)
        if (user != null) {
          print('amsdev Registro exitoso, Usuario: ${user.email}');
          await saveUser();
          onResult(true, '');
        } else {
          print('amsdev Usuario no registrado');
          onResult(false, 'error');
        }
      },
    );

    print("amsdev llega al return final en false");
  }

  Future<void> saveUser() async {
    User? user = FirebaseService.instance.getUser();
    String uid = user != null ? user.uid : '';
    final datetime = DateTime.now().toString();
    personalDataModel = personalDataModel.updateValues(
      username: uInfo.username.text,
      email: uInfo.email.text,
      password: uInfo.pass.text,
    );

    await FirebaseService.instance.db.write(
      path: '${ConstantValues.firebaseDBPath.users}/$uid',
      value: personalDataModel.toJson(),
      result: (result) {},
    );
  }

  Future<bool> deleteUser() async {
    return await FirebaseService.instance.removeUser();
  }

  String getUserId() {
    User? user = FirebaseService.instance.getUser();
    String uid = user != null ? user.uid : '';
    return uid;
  }

  bool continueToSave() {
    return uInfo.btnContinue &&
        uInfo.passConfirmError.isEmpty &&
        uInfo.emailError.isEmpty &&
        uInfo.passError.isEmpty;
  }
}
