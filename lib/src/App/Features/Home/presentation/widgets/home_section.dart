import 'package:poke_app/src/App/Core/constants/global_constants.dart';
import 'package:poke_app/src/App/Core/utils/utils.dart';
import 'package:poke_app/src/App/Features/Home/presentation/cubit/favorite_cubit.dart';
import 'package:poke_app/src/App/Features/Home/presentation/cubit/pokemon_cubit.dart';
import 'package:poke_app/src/App/Features/Home/presentation/cubit/state/pokemon_state.dart';
import 'package:poke_app/src/AtomicModel-UI/module_ui.dart';

import '../../data/models/pokemon_model.dart';

class HomeSection extends StatefulWidget {
  const HomeSection({super.key});

  @override
  HomeSectionState createState() => HomeSectionState();
}

class HomeSectionState extends State<HomeSection> {
  final PokemonCubit _cubit = Modular.get<PokemonCubit>();


  TextEditingController _searchController = TextEditingController();
  late List<PokemonModel> filters;

  @override
  void initState() {
    _searchController.addListener(_onSearchChanged);
    _cubit.fetchPokemons(AppConstants.home.apiPokemon);
    super.initState();
  }

  // Función que se llama cada vez que el texto cambia
  void _onSearchChanged() {
    _cubit.filterPokemons(_searchController.text);
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(16),
      child: BlocBuilder<PokemonCubit, PokemonState>(
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
                state.filteredPokemons.isEmpty
                    ? state.pokemons
                    : state.filteredPokemons;

            filters = state.pokemons;
            return NotificationListener<ScrollNotification>(
              onNotification: (scrollNotification) {
                if (scrollNotification is ScrollEndNotification &&
                    scrollNotification.metrics.pixels ==
                        scrollNotification.metrics.maxScrollExtent) {
                  if (state.nextUrl.isNotEmpty) {
                    filters = [];
                    _cubit.loadMorePokemons(state.nextUrl);
                  }
                }
                return false;
              },
              child: Column(
                spacing: 20,
                children: [
                  UIInputSearch(
                    enabled: true,
                    autofocus: false,
                    controller: _searchController,
                    onChanged: (value) {
                      _cubit.filterPokemons(value);
                    },
                    onClose: () {
                      _searchController.text = '';
                      _cubit.filterPokemons('');
                    },
                    hint: AppConstants.home.search,
                  ),

                  SizedBox(
                    width: double.infinity,
                    height: 600,
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
                                'id': int.parse(
                                  CoreUtils.getId(pokemon.url),
                                ),
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
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Row(
                                  children: [
                                    Spacer(),
                                    Align(
                                      child: Padding(
                                        padding: EdgeInsets.only(left: 50),
                                        child: IconButton(
                                          color: Colors.red,
                                          icon:
                                          pokemon.favorite == true
                                                  ? Icon(Icons.favorite)
                                                  : Icon(Icons.favorite_border),
                                          iconSize: 15,
                                          onPressed: () {
                                            _cubit.setStatus(
                                              '${CoreUtils.getId(pokemon.url)}#${pokemon.name}',
                                              pokemonsToShow,
                                              index,
                                              pokemon.favorite,
                                            );
                                          },
                                        ),
                                      ),
                                      alignment: Alignment.centerRight,
                                    ),
                                  ],
                                ),
                                Spacer(),
                                Stack(
                                  clipBehavior: Clip.none,
                                  children: [
                                    Container(
                                      width: double.infinity,
                                      height: 60,
                                      decoration: BoxDecoration(
                                        color: Colors.black12,
                                        borderRadius: BorderRadius.all(
                                          Radius.circular(16),
                                        ),
                                        boxShadow: [
                                          BoxShadow(
                                            color: Colors.grey.withOpacity(0.2),
                                            blurRadius: 10,
                                            offset: Offset(0, 5),
                                          ),
                                        ],
                                      ),
                                      child: Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.end,
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
                                          Text(
                                            '#${CoreUtils.getId(pokemon.url)}',
                                            style: TextStyle(
                                              fontSize: 10,
                                              fontWeight: FontWeight.bold,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                    Positioned(
                                      top: -40,
                                      left: 0,
                                      right: 0,
                                      child: Container(
                                        height: 70,
                                        width: 70,
                                        decoration: BoxDecoration(
                                          image: DecorationImage(
                                            image: NetworkImage(
                                              AppConstants.home.imgUrl
                                                  .replaceAll(
                                                    'imgUrl',
                                                    CoreUtils.getId(
                                                      pokemon.url,
                                                    ),
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
                ],
              ),
            );
          }
          return Center(child: Text(AppConstants.home.notFound));
        },
      ),
    );
  }
}
