import 'package:avatar_glow/avatar_glow.dart';
import 'package:poke_app/src/App/Core/constants/global_constants.dart';
import 'package:poke_app/src/App/Features/Home/domain/entities/tab_info.dart';
import 'package:poke_app/src/App/Features/Home/presentation/cubit/home_main_cubit.dart';
import 'package:poke_app/src/App/Features/Home/presentation/widgets/about_section.dart';
import 'package:poke_app/src/App/Features/Home/presentation/widgets/favorite_section.dart';
import 'package:poke_app/src/App/Features/Home/presentation/widgets/home_section.dart';
import 'package:poke_app/src/AtomicModel-UI/module_ui.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  HomePageState createState() => HomePageState();
}

class HomePageState extends State<HomePage> {
  final HomeMainCubit _cubit = Modular.get<HomeMainCubit>();
  int _viewIndex = 0;
  final List<TabInfo> tabs = [
    TabInfo(
      Icons.home,
      (_) => HomeSection(),
      'Inicio',
      'Simple example of Widget & List animations.',
    ),
    TabInfo(
      Icons.favorite,
      (_) => const FavoriteSection(),
      'Favoritos',
      'Animations driven by scrolling & user input.',
    ),
    TabInfo(Icons.info, (_) => const AboutSection(), 'Acerca de', ''),
  ];

  @override
  void initState() {
    super.initState();
    _cubit.listenerUserAccount();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: UIColorPalette.backgroundColor,
      appBar: AppBar(
        leading: Builder(
          builder:
              (context) => BlocConsumer<HomeMainCubit, HomeMainState>(
                bloc: _cubit,
                builder: (contextBloc, state) {
                  print("amsdev entra al build main del builder state:$state");
                  if (state is HomeMainInitial) {
                    return SizedBox.shrink();
                  }
                  return InkWell(
                    onTap: () {
                      Scaffold.of(context).openDrawer();
                    },
                    child: Padding(
                      padding: EdgeInsets.only(left: 15),
                      child: AvatarGlow(
                        glowColor: Colors.white,
                        child: Material(
                          // Replace this child with your own
                          elevation: 40.0,
                          shape: CircleBorder(),
                          child: CircleAvatar(
                            backgroundColor: Colors.black,
                            child: SvgPicture.asset(
                              AppConstants.home.pokeballPath,
                              width: 25.0,
                              height: 25.0,
                            ),
                            radius: 25.0,
                          ),
                        ),
                      ),
                    ),
                  );
                },
                listener: (BuildContext context, HomeMainState state) {
                  print("amsdev entra listener del builder state: $state");
                  if (state is HomeMainLoaded) {}
                },
              ),
        ),

        leadingWidth: 40,
        backgroundColor: UIColorPalette.backgroundColor,
        title: Row(
          spacing: 15,
          children: [
            UILabel(
              text: AppConstants.home.title,
              fontSize: UISpacing.spacingL_24,
              textColor: UIColorPalette.primaryColorLetter,
            ),
          ],
        ),
      ),
      drawer: Drawer(
        backgroundColor: Colors.white,
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            BlocConsumer<HomeMainCubit, HomeMainState>(
              bloc: _cubit,
              builder: (contextBloc, state) {
                print("amsdev entra al build main del builder state:$state");
                if (state is HomeMainInitial) {
                  return SizedBox.shrink();
                }
                return UserAccountsDrawerHeader(
                  decoration: BoxDecoration(
                    color: UIColorPalette.textCharcoal1,
                  ),
                  accountName: Text(_cubit.userAccount.username!),
                  accountEmail: Text(_cubit.userAccount.email!),
                  currentAccountPicture: CircleAvatar(
                    backgroundColor: Colors.orange,
                    child: Text(_cubit.userAccount.username!.substring(0, 1)),
                  ),
                );
              },
              listener: (BuildContext context, HomeMainState state) {
                print("amsdev entra listener del builder state: $state");
                if (state is HomeMainLoaded) {}
              },
            ),
            ListTile(
              title: Text('Inicio'),
              onTap: () {
                // Aquí puedes agregar lo que deseas hacer cuando se toque el ítem
                setState(() => _viewIndex = 0);
                Navigator.pop(context); // Cierra el Drawer
              },
            ),
            ListTile(
              title: Text('Favoritos'),
              onTap: () {
                // Aquí puedes agregar lo que deseas hacer cuando se toque el ítem
                setState(() => _viewIndex = 1);
                Navigator.pop(context); // Cierra el Drawer
              },
            ),
            ListTile(
              title: Text('Acerca de'),
              onTap: () {
                // Aquí puedes agregar lo que deseas hacer cuando se toque el ítem
                setState(() => _viewIndex = 2);
                Navigator.pop(context); // Cierra el Drawer
              },
            ),
            ListTile(
              title: Text('Cerrar sesión'),
              onTap: () {
                // Lógica para cerrar sesión, si es necesario
                Navigator.pop(context); // Cierra el Drawer
                Modular.to.pushReplacementNamed('/login');
              },
            ),
          ],
        ),
      ),
      body: SingleChildScrollView(
        child: Column(children: [tabs[_viewIndex].builder(context)]),
      ),

      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _viewIndex,
        selectedFontSize: 14,
        unselectedFontSize: 12,
        selectedItemColor: Colors.white,
        unselectedItemColor: const Color(0x998898A0),
        showSelectedLabels: true,
        showUnselectedLabels: false,
        type: BottomNavigationBarType.fixed,
        backgroundColor: UIColorPalette.backgroundColor,
        elevation: 0,
        onTap: (index) => setState(() => _viewIndex = index),
        items: [
          for (final tab in tabs)
            BottomNavigationBarItem(icon: Icon(tab.icon), label: tab.label),
        ],
      ),
    );
  }
}
