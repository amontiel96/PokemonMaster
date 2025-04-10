import 'package:poke_app/src/App/Core/constants/global_constants.dart';
import 'package:poke_app/src/AtomicModel-UI/module_ui.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  LoginPageState createState() => LoginPageState();
}

class LoginPageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
    return UIBaseScreen(
      appBarTitle: AppConstants.login.title,
      footerBackgroundColor: Colors.transparent,
      header: Column(
        children: [
          SizedBox(height: 20),
          UIAssetImage(
            path: AppConstants.home.pokeballPath,
            size: const Size.square(100),
            color: UIColorPalette.backgroundColor,
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
            keyboardType: TextInputType.text,
            hint: 'ingresa tu correo',
            label: 'Correo',
            onChanged: (text) {},
          ),

          UIInput(
            inputFormatters: [LengthLimitingTextInputFormatter(30)],
            textStyle: UITextStyles.contentLMedium_16,
            keyboardType: TextInputType.text,
            hint: 'Ingresa tu contraseña',
            label: 'Contraseña',
            obscureText: true,
            onChanged: (text) {},
          ),
          UIPrimaryButton(
            enabled: true,
            text: 'Iniciar sesión',
            onPressed: () {
              Modular.to.pushNamed('/home/');
            },
          ),
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
}
