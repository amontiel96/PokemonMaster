import 'package:poke_app/src/App/Core/constants/global_constants.dart';
import 'package:poke_app/src/App/Core/utils/utils.dart';
import 'package:poke_app/src/App/Features/Home/presentation/cubit/pokemon_cubit.dart';
import 'package:poke_app/src/App/Features/Home/presentation/cubit/state/pokemon_state.dart';
import 'package:poke_app/src/AtomicModel-UI/module_ui.dart';

import '../../data/models/pokemon_model.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  HomePageState createState() => HomePageState();
}

class HomePageState extends State<HomePage> {
  final PokemonCubit _cubit = Modular.get<PokemonCubit>();

  TextEditingController _searchController = TextEditingController();
  List<PokemonModel> _filteredPokemons =
      []; // Lista para almacenar los Pokémon filtrados
  late List<PokemonModel> filters;

  // Variable para controlar el valor seleccionado del radio button
  int? _selectedOption = 1; // El valor predeterminado es el primer radio

  @override
  void initState() {
    _searchController.addListener(_onSearchChanged);
    _cubit.fetchPokemons('https://pokeapi.co/api/v2/pokemon/');
    super.initState();
  }

  // Función que se llama cada vez que el texto cambia
  void _onSearchChanged() {
    _filterPokemons(_searchController.text);
  }

  // Función que filtra los Pokémon
  void _filterPokemons(String query) {
    final pokemons = filters; // Obtén la lista completa de Pokémon

    setState(() {
      _filteredPokemons =
          pokemons
              .where(
                (pokemon) =>
                    _selectedOption == 2
                        ? pokemon.name.toLowerCase().contains(
                          query.toLowerCase(),
                        )
                        : pokemon.url.toLowerCase().contains(
                          query.toLowerCase(),
                        ),
              )
              .toList();
    });
  }

  void _showPopup(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          backgroundColor: UIColorPalette.backgroundColor,
          title: Center(
            child: Text(
              AppConstants.home.sortBy,
              style: TextStyle(color: Colors.white),
            ),
          ),
          content: Padding(
            padding: EdgeInsets.all(10),
            child: Card(
              color: Colors.white,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  RadioListTile<int>(
                    title: Text(AppConstants.home.number),
                    value: 1,
                    activeColor: UIColorPalette.backgroundColor,
                    groupValue: _selectedOption,
                    onChanged: (int? value) {
                      setState(() {
                        _selectedOption = value;
                      });
                      Navigator.pop(context);
                    },
                  ),
                  RadioListTile<int>(
                    title: Text(AppConstants.home.name),
                    value: 2,
                    groupValue: _selectedOption,
                    activeColor: UIColorPalette.backgroundColor,
                    onChanged: (int? value) {
                      setState(() {
                        _selectedOption = value;
                      });
                      Navigator.pop(context);
                    },
                  ),
                ],
              ),
            ),
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: Text(
                AppConstants.home.cancel,
                style: TextStyle(color: Colors.white),
              ),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return UIBaseScreen(
      appBarTitleWidget: Row(
        spacing: 15,
        children: [
          SvgPicture.asset(
            AppConstants.home.pokeballPath,
            width: 25.0,
            height: 25.0,
          ),
          UILabel(
            text: AppConstants.home.title,
            fontSize: UISpacing.spacingL_24,
            textColor: UIColorPalette.primaryColorLetter,
          ),
        ],
      ),

      header: Row(
        children: [
          SizedBox(
            height: 40,
            width: 250,
            child: UIInputSearch(
              enabled: true,
              autofocus: false,
              controller: _searchController,
              onChanged: (value) {
                _filterPokemons(value);
              },
              onClose: () {
                _searchController.text = '';
                _filterPokemons('');
              },
              hint: AppConstants.home.search,
            ),
          ),
          Spacer(),
          InkWell(
            onTap: () {
              _showPopup(context);
            },
            child: Container(
              width: 40,
              height: 40,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(50),
              ),
              child:
                  _selectedOption! == 1
                      ? Icon(
                        Icons.numbers,
                        color: UIColorPalette.backgroundColor,
                      )
                      : SvgPicture.asset(
                        AppConstants
                            .home
                            .filterTextlPath, // Ruta del archivo SVG
                        width: 100.0,
                        height: 100.0,
                      ),
            ),
          ),
        ],
      ),
      body: BlocBuilder<PokemonCubit, PokemonState>(
        bloc: _cubit,
        builder: (context, state) {
          if (state is PokemonLoading) {
            return Center(child: CircularProgressIndicator());
          } else if (state is PokemonError) {
            return Center(
              child: Text('${AppConstants.home.error} ${state.message}'),
            );
          } else if (state is PokemonLoaded) {
            final pokemonsToShow =
                _filteredPokemons.isEmpty ? state.pokemons : _filteredPokemons;
            filters = state.pokemons;
            return NotificationListener<ScrollNotification>(
              onNotification: (scrollNotification) {
                if (scrollNotification is ScrollEndNotification &&
                    scrollNotification.metrics.pixels ==
                        scrollNotification.metrics.maxScrollExtent) {
                  if (state.nextUrl.isNotEmpty) {
                    filters = [];
                    _filteredPokemons = [];
                    _cubit.loadMorePokemons(state.nextUrl);
                  }
                }
                return false;
              },
              child: SizedBox(
                width: double.infinity,
                height: 500,
                child: GridView.builder(
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 3,
                    crossAxisSpacing: 10.0,
                    mainAxisSpacing: 10.0,
                    mainAxisExtent: 120,
                  ),
                  itemCount: pokemonsToShow.length,
                  itemBuilder: (context, index) {
                    final pokemon = pokemonsToShow[index];
                    return InkWell(
                      onTap: () {
                        Modular.to.pushNamed(
                          '/home/detail',
                          arguments: {
                            'name': pokemon.name,
                            'id': int.parse(CoreUtils.getId(pokemon.url)),
                            'count': state.count,
                          },
                        );
                      },
                      child: Container(
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(16),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.grey.withOpacity(0.2),
                              blurRadius: 10,
                              offset: Offset(0, 5),
                            ),
                          ],
                        ),
                        child: Column(
                          children: [
                            Padding(
                              padding: EdgeInsets.only(right: 8, top: 5),
                              child: Align(
                                alignment: Alignment.centerRight,
                                child: Text(
                                  '#${CoreUtils.getId(pokemon.url)}',
                                  style: TextStyle(
                                    fontSize: 10,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                            ),
                            Spacer(),
                            Stack(
                              clipBehavior: Clip.none,
                              children: [
                                Container(
                                  width: double.infinity,
                                  height: 60,
                                  decoration: BoxDecoration(
                                    color: Colors.grey[200],
                                    borderRadius: BorderRadius.all(
                                      Radius.circular(16),
                                    ),
                                  ),
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.end,
                                    children: [
                                      Padding(
                                        padding: const EdgeInsets.only(
                                          bottom: 10,
                                        ),
                                        child: Text(
                                          pokemon.name,
                                          style: TextStyle(
                                            fontSize: 10,
                                            fontWeight: FontWeight.w500,
                                          ),
                                          textAlign: TextAlign.center,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                Positioned(
                                  top: -60,
                                  left: 0,
                                  right: 0,
                                  child: Container(
                                    height: 100,
                                    width: 100,
                                    decoration: BoxDecoration(
                                      image: DecorationImage(
                                        image: NetworkImage(
                                          AppConstants.home.imgUrl.replaceAll(
                                            'imgUrl',
                                            CoreUtils.getId(pokemon.url),
                                          ),
                                        ),
                                        fit: BoxFit.contain,
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                ),
              ),
            );
          }
          return Center(child: Text(AppConstants.home.notFound));
        },
      ),
    );
  }
}
