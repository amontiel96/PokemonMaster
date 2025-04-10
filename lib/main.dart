import 'package:core_module/core_module.dart';
import 'package:poke_app/src/App/Features/Home/presentation/cubit/pokemon_cubit.dart';
import 'package:poke_app/src/App/Features/Home/presentation/cubit/pokemon_detail_cubit.dart';
import 'package:poke_app/src/App/Features/Home/presentation/cubit/pokemon_species_cubit.dart';
import 'package:poke_app/src/App/app_module.dart';
import 'package:poke_app/src/AtomicModel-UI/module_ui.dart';

import 'src/App/Core/module_core.dart';

import 'package:poke_app/src/App/injection_container.dart' as di;
import 'package:poke_app/src/App/injection_container.dart';

import 'src/App/Features/SingUp/presentation/cubit/singup_cubit.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  try {
    di.init(); // inyectamos las dependencias necesarias
    await FirebaseService.initConnection();

    print('amsdev inciializo firebase');
    await FirebaseService.startServices();
    print("amsdev servicios inicalizados");
  } catch (e, s) {
    debugPrint(e.toString());
    debugPrintStack(stackTrace: s);
  }
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]).then((_) {
    runApp(const MasterApp());
  });
}

class MasterApp extends StatelessWidget {
  const MasterApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (_) => sl<PokemonCubit>()),
        BlocProvider(create: (_) => sl<PokemonDetailCubit>()),
        BlocProvider(create: (_) => sl<PokemonSpeciesCubit>()),
        BlocProvider(create: (_) => sl<SignupCubit>()),
      ],
      child: ModularApp(
        module: AppModule(),
        child: MainWidget(initialRoute: '/', title: AppConstants.appName),
      ),
    );
  }
}

class MainWidget extends StatefulWidget {
  const MainWidget({
    super.key,
    required this.title,
    required this.initialRoute,
  });

  final String title;
  final String initialRoute;

  @override
  State<MainWidget> createState() => _MainWidgetState();
}

class _MainWidgetState extends State<MainWidget> {
  @override
  void initState() {
    super.initState();
    Modular.setInitialRoute(widget.initialRoute);
  }

  Future<bool> _init() async {
    try {
      await StorageCoreService.instance.initStorageServices();
      return true;
    } catch (e) {
      return true;
    }
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      initialData: false,
      future: _init(),
      builder: (BuildContext context, AsyncSnapshot snapshot) {
        if (!snapshot.data) {
          return const Directionality(
            textDirection: TextDirection.ltr,
            child: Scaffold(
              backgroundColor: UIColorPalette.primaryWhite,
              body: UIDialogLoader(),
            ),
          );
        }

        return MaterialApp.router(
          debugShowCheckedModeBanner: false,
          title: AppConstants.appName,
          routeInformationParser: Modular.routeInformationParser,
          routerDelegate: Modular.routerDelegate,
          builder: (context, child) {
            return MediaQuery(
              data: MediaQuery.of(context).copyWith(textScaleFactor: 1.0),
              child: child!,
            );
          },
        );
      },
    );
  }
}
