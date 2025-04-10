import 'dart:math';

import 'package:confetti/confetti.dart';
import 'package:poke_app/src/App/Core/constants/global_constants.dart';
import 'package:poke_app/src/App/Features/SingUp/presentation/cubit/singup_cubit.dart';

import 'package:poke_app/src/AtomicModel-UI/module_ui.dart';

class RegisterCompletePage extends StatefulWidget {
  const RegisterCompletePage({super.key});

  @override
  RegisterCompletePageState createState() => RegisterCompletePageState();
}

class RegisterCompletePageState extends State<RegisterCompletePage> {
  late ConfettiController _controllerCenter;
  late ConfettiController _controllerCenter2;

  @override
  void initState() {
    super.initState();
    _controllerCenter = ConfettiController(
      duration: const Duration(seconds: 10),
    );
    _controllerCenter2 = ConfettiController(
      duration: const Duration(seconds: 10),
    );

    _controllerCenter.play();
    _controllerCenter.play();
    _controllerCenter2.play();

    Future.delayed(const Duration(seconds: 15), () {
      _controllerCenter.stop();
      _controllerCenter2.stop();
    });
  }

  @override
  void dispose() {
    super.dispose();
    _controllerCenter.dispose();
    _controllerCenter2.dispose();
  }

  Widget _baseBody(context) {
    return UIBaseScreen(
      appBarTitle: 'Registro',
      footerBackgroundColor: Colors.transparent,
      header: Column(
        children: [
          SizedBox(height: 20),
          UILabel(
            text: 'COMPLETADO',
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
          Align(
            alignment: Alignment.center,
            child: ConfettiWidget(
              confettiController: _controllerCenter,
              blastDirectionality: BlastDirectionality.explosive,
              // don't specify a direction, blast randomly
              shouldLoop: true,
              // start again as soon as the animation is finished
              colors: const [
                Colors.green,
                Colors.blue,
                Colors.pink,
                Colors.orange,
                Colors.purple,
              ],
              // manually specify the colors to be used
              createParticlePath: drawStar, // define a custom shape/path.
            ),
          ),

          //CENTER RIGHT -- Emit left
          const SizedBox(height: 20),

          Text(
            "¡Felicidades!",
            style: UITextStyles.headlineH2_28.copyWith(
              color: UIColorPalette.trainColorPrimaryTxt,
            ),
          ),

          Text(
            "Ya eres un(a) maestro(a) pokemon",
            style: UITextStyles.headlineH2_28.copyWith(
              color: UIColorPalette.trainColorPrimaryTxt,
            ),
          ),
          Align(
            alignment: Alignment.centerLeft,
            child: ConfettiWidget(
              confettiController: _controllerCenter2,
              blastDirectionality: BlastDirectionality.explosive,
              // don't specify a direction, blast randomly
              shouldLoop: true,
              // start again as soon as the animation is finished
              colors: const [
                Colors.green,
                Colors.blue,
                Colors.pink,
                Colors.orange,
                Colors.purple,
              ],
              // manually specify the colors to be used
              createParticlePath: drawStar, // define a custom shape/path.
            ),
          ),
          Align(
            alignment: Alignment.centerRight,
            child: ConfettiWidget(
              confettiController: _controllerCenter2,
              blastDirectionality: BlastDirectionality.explosive,
              // don't specify a direction, blast randomly
              shouldLoop: true,
              // start again as soon as the animation is finished
              colors: const [
                Colors.green,
                Colors.blue,
                Colors.pink,
                Colors.orange,
                Colors.purple,
              ],
              // manually specify the colors to be used
              createParticlePath: drawStar, // define a custom shape/path.
            ),
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
                text: 'Empezar la aventura',
                onPressed: () async {
                  Modular.to.pushReplacementNamed('/home');
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  Path drawStar(Size size) {
    // Method to convert degree to radians
    double degToRad(double deg) => deg * (pi / 180.0);

    const numberOfPoints = 5;
    final halfWidth = size.width / 2;
    final externalRadius = halfWidth;
    final internalRadius = halfWidth / 2.5;
    final degreesPerStep = degToRad(360 / numberOfPoints);
    final halfDegreesPerStep = degreesPerStep / 2;
    final path = Path();
    final fullAngle = degToRad(360);
    path.moveTo(size.width, halfWidth);

    for (double step = 0; step < fullAngle; step += degreesPerStep) {
      path.lineTo(
        halfWidth + externalRadius * cos(step),
        halfWidth + externalRadius * sin(step),
      );
      path.lineTo(
        halfWidth + internalRadius * cos(step + halfDegreesPerStep),
        halfWidth + internalRadius * sin(step + halfDegreesPerStep),
      );
    }
    path.close();
    return path;
  }

  @override
  Widget build(BuildContext context) {
    return _baseBody(context);
  }
}
