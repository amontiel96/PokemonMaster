import 'package:poke_app/src/App/Features/Login/login_module.dart';
import 'package:poke_app/src/App/Features/SingUp/sing_up_module.dart';
import 'package:poke_app/src/AtomicModel-UI/module_ui.dart';
import 'Features/Home/home_module.dart';
import 'Features/Onboarding/onboarding_module.dart';

class AppModule extends Module {
  @override
  List<Module> get imports => [
    HomeModule(),
    OnboardingModule(),
    SingUpModule(),
    LoginModule(),
  ];

  @override
  void binds(Injector i) {}

  @override
  void routes(RouteManager r) {
    r.module(Modular.initialRoute, module: OnboardingModule());
    r.module('/home', module: HomeModule());
    r.module('/login', module: LoginModule());
    r.module('/singUp', module: SingUpModule());
  }
}
