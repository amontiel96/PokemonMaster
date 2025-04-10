import 'package:flutter_modular/flutter_modular.dart';

import 'presentation/pages/register_page.dart';

class SingUpModule extends Module {
  @override
  void binds(Injector i) {}

  @override
  void routes(RouteManager r) {
    r.child('/', child: (context) => RegisterPage());
    //r.child('/ob', child: (context) => const OnBoardingPage(),guards: [FirstRunGuard()]);
  }
}
