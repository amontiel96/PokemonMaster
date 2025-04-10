import 'package:core_module/core_module.dart';
import 'package:poke_app/src/App/Core/constants/global_constants.dart';
import 'package:poke_app/src/App/Features/SingUp/presentation/cubit/singup_cubit.dart';

import 'package:poke_app/src/AtomicModel-UI/module_ui.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});

  @override
  RegisterPageState createState() => RegisterPageState();
}

class RegisterPageState extends State<RegisterPage> {
  final SignupCubit _cubit = Modular.get<SignupCubit>();

  List<TDSMSlotPassValModel> rules = [
    TDSMSlotPassValModel('LIM_LETTERS', 'Entre 8 y 16 caracteres', 1),
    TDSMSlotPassValModel('UPPERCASE_LETTER', 'Al menos una letra mayúscula', 1),
    TDSMSlotPassValModel('LOWERCASE_LETTER', 'Al menos una letra minúscula', 1),
    TDSMSlotPassValModel(
      'NUM_SYM_LETTER',
      'Al menos un número o símbolo ( no utilizar “ñ” o tildes)',
      1,
    ),
  ];

  late PasswordPinValidations passwordPinValidations;

  @override
  void initState() {
    super.initState();
    passwordPinValidations = PasswordPinValidations(rules);
    _cubit.initScreen();
  }

  Widget _baseCubitListener(context) {
    return BlocConsumer<SignupCubit, SignupState>(
      bloc: _cubit,
      builder: (context, state) {
        return _baseBody(context);
      },
      listener: (BuildContext context, SignupState state) {},
    );
  }

  Widget _baseBody(context) {
    return UIBaseScreen(
      appBarTitle: 'Registro',
      footerBackgroundColor: Colors.transparent,
      header: Column(
        children: [
          SizedBox(height: 20),
          UILabel(
            text: 'INFORMACIÓN DE CUENTA',
            fontSize: UISpacing.spacingM_16,
            alignment: Alignment.center,
          ),
          UIDivider(),
        ],
      ),
      headerBackgroundColor: Colors.transparent,
      body: Column(
        spacing: 10,
        children: [
          UIInput(
            inputFormatters: [LengthLimitingTextInputFormatter(30)],
            textStyle: UITextStyles.contentLMedium_16,
            keyboardType: TextInputType.text,
            hint: 'ingresa tu nombre de usuario',
            label: 'Nombre de usuario',
            onChanged: (text) {
              _cubit.validUserName();
            },
            controller: _cubit.uInfo.username,
          ),
          UIInput(
            inputFormatters: [LengthLimitingTextInputFormatter(50)],
            textStyle: UITextStyles.contentLMedium_16,
            keyboardType: TextInputType.name,
            label: 'Correo electrónico',
            controller: _cubit.uInfo.email,
            onChanged: (text) {
              _cubit.step5EmailValidationEvent();
            },
            error:
                _cubit.uInfo.emailError.isNotEmpty
                    ? _cubit.uInfo.emailError
                    : null,
          ),
          UIInput(
            inputFormatters: [LengthLimitingTextInputFormatter(16)],
            //backgroundTransparent: false,
            textStyle: UITextStyles.contentLMedium_16,
            keyboardType: TextInputType.name,
            label: 'Contraseña',
            controller: _cubit.uInfo.pass,
            error:
                _cubit.uInfo.passError.isNotEmpty
                    ? _cubit.uInfo.passError
                    : null,
            obscureText: !_cubit.uInfo.showPassword,
            onChanged: (text) {
              bool isValid = passwordPinValidations.validateRules(
                ffPassword: false,
                value: text,
              );

              _cubit.uInfo.dataRules = passwordPinValidations.convertListToJson(
                rules,
              );
              _cubit.verifyPasswordEvent(isValid: isValid);
            },
            suffixIcon: IconButton(
              icon: Icon(
                _cubit.uInfo.showPassword
                    ? CupertinoIcons.eye_solid
                    : CupertinoIcons.eye_slash_fill,
                color: UIColorPalette.trainColorPrimarySecondary,
              ),
              onPressed: () {
                if (_cubit.uInfo.showPassword) {
                  _cubit.uInfo.showPassword = false;
                } else {
                  _cubit.uInfo.showPassword = true;
                }
                _cubit.changeViewPassword();
              },
            ),
          ),
          Visibility(
            visible: _cubit.uInfo.passError.isNotEmpty,
            child: UISlotPassValidation(
              items: _cubit.uInfo.dataRules,
              title: 'Tu contraseña debe tener al menos:',
              errorMessage: '',
            ),
          ),
          UIInput(
            inputFormatters: [LengthLimitingTextInputFormatter(16)],
            //backgroundTransparent: false,
            textStyle: UITextStyles.contentLMedium_16,
            keyboardType: TextInputType.name,
            label: 'Confirmar contraseña',
            controller: _cubit.uInfo.passConfirm,
            onChanged: (text) {
              _cubit.confirmPasswordEvent();
            },
            error:
                _cubit.uInfo.passConfirmError.isNotEmpty
                    ? _cubit.uInfo.passConfirmError
                    : null,
            obscureText: !_cubit.uInfo.showPasswordConfirm,
            suffixIcon: IconButton(
              icon: Icon(
                _cubit.uInfo.showPasswordConfirm
                    ? CupertinoIcons.eye_solid
                    : CupertinoIcons.eye_slash_fill,
                color: UIColorPalette.trainColorPrimarySecondary,
              ),
              onPressed: () {
                if (_cubit.uInfo.showPasswordConfirm) {
                  _cubit.uInfo.showPasswordConfirm = false;
                } else {
                  _cubit.uInfo.showPasswordConfirm = true;
                }
                _cubit.changeViewPassword();
              },
            ),
          ),
          Visibility(
            visible: _cubit.createError,
            child: Padding(
            padding: EdgeInsets.all(16),
            child: UILabel(
              text: 'Error al crear cuenta, vuelve a intentarlo',
              textColor: Colors.red,
              alignment: Alignment.center,
            ),
          ),)
        ],
      ),
      footer: Padding(
        padding: EdgeInsets.only(bottom: 30, left: 15),
        child: Column(
          spacing: 10,
          children: [
            Padding(
              padding: EdgeInsets.only(bottom: 15),
              child: UIPrimaryButton(
                enabled: _cubit.continueToSave(),
                text: 'Crear cuenta',
                onPressed: () async {
                  if (_cubit.continueToSave()) {
                    UILoaderScreen.showPageLoading(context);
                    _cubit.createUser(
                      onResult: (result, msg) {
                        UILoaderScreen.cancelPageLoading(context);
                        if (result) {
                          Modular.to.pushReplacementNamed('/singUp/registerComplete');
                        }else{
                          _cubit.errorCreateUser();
                        }

                      },
                    );
                  }

                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return _baseCubitListener(context);
  }
}
