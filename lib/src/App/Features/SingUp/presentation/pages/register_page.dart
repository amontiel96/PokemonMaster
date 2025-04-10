import 'package:poke_app/src/App/Core/constants/global_constants.dart';

import 'package:poke_app/src/AtomicModel-UI/module_ui.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});

  @override
  RegisterPageState createState() => RegisterPageState();
}

class RegisterPageState extends State<RegisterPage> {
  @override
  Widget build(BuildContext context) {
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
            onChanged: (text) {},
          ),
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
            hint: 'ingresa tu contraseña',
            label: 'Contraseña',
            onChanged: (text) {},
          ),
          UIInput(
            inputFormatters: [LengthLimitingTextInputFormatter(30)],
            textStyle: UITextStyles.contentLMedium_16,
            keyboardType: TextInputType.text,
            hint: 'repite tu contraseña',
            label: 'Confirmación de Contraseña',
            onChanged: (text) {},
          ),
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
                enabled: true,
                text: 'Crear cuenta',
                onPressed: () {
                  //Modular.to.pushNamed('/singUp/userData');
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
