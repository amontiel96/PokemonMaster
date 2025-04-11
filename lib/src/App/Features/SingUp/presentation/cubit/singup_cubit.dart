import 'package:core_module/core_module.dart';
import 'package:poke_app/src/App/Features/SingUp/data/models/personal_data_model.dart';
import 'package:poke_app/src/App/Features/SingUp/domain/useCases/register_process.dart';
import 'package:poke_app/src/AtomicModel-UI/module_ui.dart';

part 'state/singup_state.dart';

class SignupCubit extends Cubit<SignupState> {
  SignupCubit() : super(SignupInitial());
  UserInformationCase uInfo = UserInformationCase();

  PersonalDataModel personalDataModel = PersonalDataModel();

  final prefs = StorageCoreService.instance.prefs;

  bool createError = false;
  String msgError = "";

  void initScreen() {
    uInfo = UserInformationCase();
    personalDataModel = PersonalDataModel();
    createError = false;
    emit(SignupInitial());
  }

  void errorCreateUser(msg) {
    createError = true;
    msgError = msg;
    emit(SignupError());
  }

  void changeViewPassword() {
    emit(SignupViewPasswordState());
  }

  void emailValidationEvent() {
    uInfo.emailValidation();
    emit(SignupDataChangeState());
  }

  void validUserName() {
    uInfo.validationVerify();
    emit(SignupDataChangeState());
  }

  void verifyPasswordEvent({required bool isValid}) {
    uInfo.verifyPassword(isValid);
    emit(SignupDataChangeState());
  }

  void confirmPasswordEvent() {
    uInfo.passwordConfirm();
    emit(SignupDataChangeState());
  }

  void createUser({required Function(bool, String) onResult}) async {
    final result = await FirebaseService.instance.signUp(
      uInfo.email.text.trim(),
      uInfo.pass.text.trim(),
    );
    result.fold(
      (exception) {
        onResult(false, exception.toString());
      },
      (user) async {
        if (user != null) {
          await saveUser();
          onResult(true, '');
        } else {
          onResult(false, 'error');
        }
      },
    );
  }

  Future<void> saveUser() async {
    User? user = FirebaseService.instance.getUser();
    String uid = user != null ? user.uid : '';
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
}
