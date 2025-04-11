
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

  void errorLogin(msg){
    loginError = true;
    msgError = msg;
    emit(PreLoginError());
  }
  
  void validCurrentUser() async{
    String newUser = FirebaseService.instance.getUser()!.uid ?? '';
    String currentUser = prefs.getValue(key: 'userid',type: StorageDataType.string,) ?? '';
    if(currentUser.isNotEmpty){
      if(currentUser != newUser){
        print("amsdev es diferente user se boorara storage");
        prefs.clear();
      }
    }
    await prefs.write(key: 'userid', value: FirebaseService.instance.getUser()!.uid ?? '');
  }

  void navigateRegisterScreen(){
    print("amsdev ejecuta evento register screen");
    emit(PreLoginRedirectRegisterScreen());
  }

  void layoutSingInStart(){
    print("amsdev ejecuta evento authstart");
    emit(PreLoginLayoutAuthScreenStart());
  }

  void initScreen(){
    loginError = false;
    emit(PreLoginInitial());
  }

  void onBackToPreLogin(){
    emit(PreLoginOnBackPrelogin());
  }
  
  void preLoginShow(){
    emit(PreLoginShowState());
  }
  
  void changeViewPassword(){
    emit(PreLoginRedirectRegisterScreen());
  }



  void signIn()async {
    try {
      print("amsdev entra signi");
      emit(PreLoginLoading());
      //await Future.delayed(Duration(seconds: 5));
      await FirebaseService.instance.signOut();
      Map<String, dynamic> result = await FirebaseService.instance.signIn(email.text.toString().trim(), pass.text.toString().trim());
      print("amsdev result: ${result.toString()}");
      bool isSuccess = result['success'];
      String error = result['error'] ?? '';
      bool isEmailValid = false;
      if(isSuccess){
        User? currentUser = FirebaseService.instance.getUser();


        /*if (currentUser!=null) {
          isEmailValid = currentUser.emailVerified;
          if(!isEmailValid){
            error = "Correo no verificado";
            currentUser.sendEmailVerification();
            FirebaseService.instance
                .startEmailVerificationListener(timeoutSeconds: minTimeout * 60);
          }

        }*/
        print("amsdev isEmailValid: $isEmailValid");

      }


      emit(PreLoginLoaded(isSuccess: isSuccess, isEmailValid: isEmailValid, errorMessage: error));
    }catch(e){
     emit(PreLoginLoaded(isSuccess: false, isEmailValid: false, errorMessage: '!Ocurrio un error¡'));
    }
  }

  Future<void> resendEmail() async {
    User? user = FirebaseService.instance.getUser();
    await user!.sendEmailVerification().whenComplete(() {
      print('amsdev Email reenviado');
      FirebaseService.instance
          .startEmailVerificationListener(timeoutSeconds: minTimeout * 60);
    }).catchError((onError) {
      print('amsdev Error al reenviar el email: $onError');
    });
  }

  void emailValidation() {
    emailError = '';
    validInputs();

    if (!FormatterUtils.isValidEmail(email.text.trim())) {
      emailError = 'Correo no valido';
      isEnabledBtnInit = false;
    }
    //validInputs();
    emit(PreLoginEmailValidation());
  }

  void validInputs() {
    isEnabledBtnInit = true;
    if(email.text.trim().isEmpty || pass.text.trim().isEmpty){
      isEnabledBtnInit = false;
    }
    emit(PreLoginEmailValidation());
  }

}
