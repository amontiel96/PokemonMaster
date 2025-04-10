import 'package:flutter_modular/flutter_modular.dart';
import 'package:poke_app/src/App/Features/SingUp/presentation/cubit/singup_cubit.dart';
import 'package:poke_app/src/App/Features/SingUp/presentation/pages/register_complete_page.dart';

import 'presentation/pages/register_page.dart';

class SingUpModule extends Module {
  @override
  void binds(Injector i) {
    i.addSingleton<SignupCubit>(() => SignupCubit());
  }

  @override
  void routes(RouteManager r) {
    r.child('/', child: (context) => RegisterPage());
    r.child('/registerComplete', child: (context) => RegisterCompletePage());
  }
}
