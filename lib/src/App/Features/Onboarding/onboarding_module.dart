import 'package:flutter_modular/flutter_modular.dart';
import 'package:poke_app/src/App/Features/Onboarding/domain/useCases/get_message.dart';
import 'package:poke_app/src/App/Features/Onboarding/presentation/cubit/message_cubit.dart';

import 'package:poke_app/src/App/injection_container.dart';

import 'presentation/pages/initial_page.dart';


class OnboardingModule extends Module {
  @override
  void binds(Injector i) {
    //i.addSingleton<MessageCubit>(() => MessageCubit(sl<GetMessage>()));
  }

  @override
  void routes(RouteManager r) {
    r.child('/', child: (context) => InitialPage());
    //r.child('/ob', child: (context) => const OnBoardingPage(),guards: [FirstRunGuard()]);
  }

}