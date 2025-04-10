import 'package:avatar_glow/avatar_glow.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:poke_app/src/App/Core/constants/global_constants.dart';
import 'package:poke_app/src/App/Features/Login/presentation/cubit/login_cubit.dart';
import 'package:poke_app/src/AtomicModel-UI/module_ui.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  LoginPageState createState() => LoginPageState();
}

class LoginPageState extends State<LoginPage> {
  final LoginCubit _cubit = Modular.get<LoginCubit>();
  bool showPassword = false;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _cubit.initScreen();
  }

  Widget _baseCubitListener(context) {

    return BlocConsumer<LoginCubit, LoginState>(
      bloc: _cubit,
      builder: (context, state) {
        return
          _screen(context);
      },
      listener: (BuildContext context, LoginState state) {
        if(state is PreLoginLoading){
          UILoaderScreen.showPageLoading(context);
        }
        if(state is PreLoginLoaded){
          UILoaderScreen.cancelPageLoading(context);
          if(!state.isSuccess){
            _cubit.errorLogin(state.errorMessage);
          }else{
            Modular.to.popAndPushNamed('/home');
          }

        }
      },
    );
  }

  Widget _screen(context){
    return UIBaseScreen(
      appBarTitle: AppConstants.login.title,
      footerBackgroundColor: Colors.transparent,
      header: Column(
        children: [
          SizedBox(height: 20),
          AvatarGlow(
            glowColor: Colors.red,
            child: Material(
              // Replace this child with your own
              elevation: 40.0,
              shape: CircleBorder(),
              child: CircleAvatar(
                backgroundColor: Colors.black,
                child: UIAssetImage(
                  path: AppConstants.home.pokeballPath,
                  size: const Size.square(100),
                  color: UIColorPalette.backgroundColor,
                ),
                radius: 25.0,
              ),
            ),
          ),
        ],
      ),
      headerBackgroundColor: Colors.transparent,
      body: Column(
        spacing: 10,
        children: [
          UIInput(
            inputFormatters: [LengthLimitingTextInputFormatter(30)],
            textStyle: UITextStyles.contentLMedium_16,
            prefix: Icon(
              MdiIcons.email,
              color: UIColorPalette.trainColorPrimarySecondary,
            ),
            label: 'Correo electronico',
            controller: _cubit.email,
            onChanged: (text) {
              _cubit.emailValidation();
            },
            error: _cubit.emailError.isNotEmpty ? _cubit.emailError : null,
          ),
          UIInput(
            inputFormatters: [LengthLimitingTextInputFormatter(15)],
            textStyle: UITextStyles.contentLMedium_16,
            suffixIcon: IconButton(
              icon: Icon(
                showPassword
                    ? CupertinoIcons.eye_solid
                    : CupertinoIcons.eye_slash_fill,
                color: UIColorPalette.trainColorPrimarySecondary,
              ),
              onPressed: () {
                if (showPassword) {
                  showPassword = false;
                } else {
                  showPassword = true;
                }
                _cubit.changeViewPassword();
              },
            ),
            label: 'Contraseña',
            obscureText: !showPassword,
            controller: _cubit.pass,
            onChanged: (text) {
              _cubit.validInputs();
            },
          ),

          UIPrimaryButton(
            enabled: _cubit.isEnabledBtnInit && _cubit.emailError.isEmpty,
            text: 'Ingresar',
            onPressed: () {
              if(_cubit.isEnabledBtnInit && _cubit.emailError.isEmpty){
                _cubit.signIn();
              }
            },
          ),
          Visibility(
            visible: _cubit.loginError,
            child: Padding(
              padding: EdgeInsets.all(16),
              child: UILabel(
                text: _cubit.msgError,
                textColor: Colors.red,
                alignment: Alignment.center,
              ),
            ),)
        ],
      ),
      footer: Padding(
        padding: EdgeInsets.only(bottom: 30, left: 15),
        child: Column(
          children: [
            InkWell(
              child: UILabel(
                text: 'Registrarse',
                fontSize: UISpacing.spacingM_16,
              ),
              onTap: () {
                Modular.to.pushNamed('/singUp');
              },
            ),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return
      _baseCubitListener(context);
  }
}
