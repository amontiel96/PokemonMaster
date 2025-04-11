import 'package:flutter_animate/flutter_animate.dart';
import 'package:poke_app/src/App/Core/constants/global_constants.dart';
import 'package:poke_app/src/AtomicModel-UI/module_ui.dart';

class InitialPage extends StatefulWidget {
  const InitialPage({super.key});

  @override
  InitialPageState createState() => InitialPageState();
}

class InitialPageState extends State<InitialPage> {
  Widget titleFinal = Text(
    "BIENVENIDO",
    style: UITextStyles.headlineH1_36.copyWith(
      color: UIColorPalette.backgroundColor,
    ),
  );

  @override
  @override
  void initState() {
    super.initState();
    titleFinal =
        titleFinal
            .animate(onPlay: (controller) => controller.stop)
            .shimmer(
              duration: 2500.ms,
              color: UIColorPalette.trainColorPrimaryLabel,
            )
            .animate() // this wraps the previous Animate in another Animate
            .fadeIn(duration: 2500.ms, curve: Curves.linear)
            .slide();
  }

  @override
  Widget build(BuildContext context) {
    return UIBaseScreen(
      appBarTitle: AppConstants.onboarding.title,
      body: Column(
        spacing: 30,
        children: [
          titleFinal,
          Column(
            spacing: 10,
            children: [
              UIPrimaryButton(
                enabled: true,
                text: 'Ir a Login',
                onPressed: () {
                  Modular.to.pushNamed('/login');
                  //Modular.to.pushReplacementNamed('/home');
                },
              ),
              UISecondaryButton(
                text: 'Registrar',
                onPressed: () {
                  Modular.to.pushNamed('/singUp');
                  //Modular.to.pushReplacementNamed('/home');
                },
              ),
            ],
          ),
        ],
      ),
    );
  }
}
