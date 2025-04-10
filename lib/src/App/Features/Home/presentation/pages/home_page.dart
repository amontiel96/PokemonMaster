import 'package:poke_app/src/App/Core/constants/global_constants.dart';
import 'package:poke_app/src/App/Features/Home/domain/entities/tab_info.dart';
import 'package:poke_app/src/App/Features/Home/presentation/widgets/about_section.dart';
import 'package:poke_app/src/App/Features/Home/presentation/widgets/home_section.dart';
import 'package:poke_app/src/AtomicModel-UI/module_ui.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  HomePageState createState() => HomePageState();
}

class HomePageState extends State<HomePage> {
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
      (_) => const Text('Favoritos'),
      'Favoritos',
      'Animations driven by scrolling & user input.',
    ),
    TabInfo(Icons.info, (_) => const AboutSection(), 'Acerca de', ''),
  ];

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: UIColorPalette.backgroundColor,
      appBar: AppBar(
        leading: Builder(
          builder:
              (context) => InkWell(
                onTap: () {
                  Scaffold.of(context).openDrawer();
                },
                child: Padding(
                  padding: EdgeInsets.only(left: 15),
                  child: SvgPicture.asset(
                    AppConstants.home.pokeballPath,
                    width: 25.0,
                    height: 25.0,
                  ),
                ),
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
            UserAccountsDrawerHeader(
              decoration: BoxDecoration(color: UIColorPalette.textCharcoal1),
              accountName: Text('Mateo Montiel'),
              accountEmail: Text('mateo.montiel@gmail.com'),
              currentAccountPicture: CircleAvatar(
                backgroundColor: Colors.orange,
                child: Text('M'),
              ),
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
