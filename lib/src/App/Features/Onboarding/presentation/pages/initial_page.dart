import 'package:poke_app/src/App/Core/constants/global_constants.dart';
import 'package:poke_app/src/AtomicModel-UI/module_ui.dart';


class InitialPage extends StatefulWidget {
  const InitialPage({super.key});

  @override
  InitialPageState createState() => InitialPageState();
}

class InitialPageState extends State<InitialPage> {
  @override
  Widget build(BuildContext context) {
    return UIBaseScreen(
      appBarTitle: AppConstants.onboarding.title,
      body: Column(
        children: [
          UILabel(text: 'Binvenido a pokedex'),
          UIPrimaryButton(
            enabled: true,
            text: 'Ir a Login',
            onPressed: () {
              Modular.to.pushNamed('/home');
              //Modular.to.pushReplacementNamed('/home');
              },
          ),
        ],
      ),
    );
  }
}
