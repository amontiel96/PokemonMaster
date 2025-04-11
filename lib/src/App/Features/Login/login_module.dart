import 'package:flutter_modular/flutter_modular.dart';
import 'package:poke_app/src/App/Features/Login/presentation/cubit/login_cubit.dart';
import 'package:poke_app/src/App/Features/Login/presentation/pages/login_page.dart';

class LoginModule extends Module {
  @override
  void binds(Injector i) {
    i.addSingleton<LoginCubit>(() => LoginCubit());
  }

  @override
  void routes(RouteManager r) {
    r.child('/', child: (context) => LoginPage());
  }
}
