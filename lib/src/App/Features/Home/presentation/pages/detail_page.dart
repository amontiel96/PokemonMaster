import 'dart:math';

import 'package:poke_app/src/App/Core/constants/global_constants.dart';
import 'package:poke_app/src/AtomicModel-UI/module_ui.dart';
import 'package:step_progress_indicator/step_progress_indicator.dart';

import '../../../../../AtomicModel-UI/organisms/tdsm_backgroud.dart';
import '../../../../../AtomicModel-UI/organisms/tdsm_header.dart';
import '../../../../../AtomicModel-UI/organisms/tdsm_header_scaffold.dart';
import '../../../../Core/utils/utils.dart';
import '../cubit/pokemon_detail_cubit.dart';
import '../cubit/pokemon_species_cubit.dart';

class DetailPage extends StatefulWidget {
  const DetailPage({super.key});

  @override
  DetailPageState createState() => DetailPageState();
}

class DetailPageState extends State<DetailPage> {
  final Map<String, dynamic> arguments = Modular.args.data;
  late String name;
  late int id;
  late int count;
  final pokemonCubit = Modular.get<PokemonDetailCubit>();
  final speciesCubit = Modular.get<PokemonSpeciesCubit>();

  @override
  void initState() {
    name = arguments['name'];
    id = arguments['id'];
    count = arguments['count'];
    pokemonCubit.fetchPokemonDetails(id);
    speciesCubit.fetchPokemonSpeciesDetails(id);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return _screen();
  }

  Widget _screen() {
    return BlocBuilder<PokemonDetailCubit, PokemonDetailState>(
      bloc: pokemonCubit,
      builder: (context, state) {
        if (state is PokemonLoading) {
          return Center(child: CircularProgressIndicator());
        } else if (state is PokemonError) {
          return Center(
            child: Text('${AppConstants.home.error} ${state.message}'),
          );
        } else if (state is PokemonLoaded) {
          final pokemon = state.pokemon;
          return TDSMHeaderScaffold(
            appBarColor:pokemon.types[0] !=null? CoreUtils.getPokemonBackgroundColor(
              pokemon.types[0],
            ): Colors.black,
            backgroundType: TDSMBgType.medium,
            backgroundColor: Colors.white,
            showBottomBar: false,
            header: TDSMHeader.withTitle(
              key: const Key('detail'),
              title: pokemon.name,
              onActionPressed: () => Modular.to.pop(),
              onNext: UILabel(text: "$id", textColor: Colors.white),
            ),
            heightBodyStart: 80,
            body: SingleChildScrollView(child: _body(pokemon)),
          );
        }
        return Container();
      },
    );
  }

  Widget _body(pokemon) {
    return Column(
      spacing: 20,
      children: [
        Padding(
          padding: EdgeInsets.all(5),
          child: Row(
            children: [
              if (id >= 2)
                InkWell(
                  onTap: () {
                    id = id - 1;
                    pokemonCubit.fetchPokemonDetails(id);
                    speciesCubit.fetchPokemonSpeciesDetails(id);
                  },
                  child: Icon(Icons.navigate_before, color: Colors.white),
                ),
              Spacer(),
              Image.network(
                AppConstants.home.imgUrl.replaceAll('imgUrl', '$id'),
                height: 300,
                width: 300,
                fit: BoxFit.contain,
              ),
              Spacer(),
              InkWell(
                onTap: () {
                  id = id + 1;
                  pokemonCubit.fetchPokemonDetails(id);
                  speciesCubit.fetchPokemonSpeciesDetails(id);
                },
                child: Icon(Icons.navigate_next, color: Colors.white),
              ),
            ],
          ),
        ),

        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          spacing: 10,
          children: [
            for (int i = 0; i < pokemon.types.length; i++)
              Container(
                height: 20,
                width: 60,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(50),
                  color: CoreUtils.getPokemonBackgroundColor(
                    "${pokemon.types[i]}",
                  ),
                ),
                child: Center(
                  child: Text(
                    "${pokemon.types[i]}",
                    style: TextStyle(color: Colors.white, fontSize: 12),
                  ),
                ),
              ),
          ],
        ),

        Center(
          child: Text(
            AppConstants.home.about,
            style: TextStyle(
              color: CoreUtils.getPokemonBackgroundColor("${pokemon.types[0]}"),
              fontSize: 18,
            ),
          ),
        ),

        // Separadores verticales (como un Divider vertical)
        Row(
          children: [
            Column(
              children: [
                Text('${pokemon.weight / 10} kg'),
                Text(AppConstants.home.weight),
              ],
            ),
            Padding(
              padding: EdgeInsets.only(left: 30),
              child: Container(
                width: 1, // Un ancho de 1 para el divisor vertical
                height: 50, // Ajusta la altura del divisor vertical
                color: Colors.grey, // Color gris para el divisor
              ),
            ),
            Spacer(),
            Column(
              children: [
                Text('${pokemon.height / 10} m'),
                Text(AppConstants.home.height),
              ],
            ),
            Padding(
              padding: EdgeInsets.only(left: 30),
              child: Container(width: 1, height: 50, color: Colors.grey),
            ),
            Spacer(),
            Column(
              children: [
                Column(
                  children: [
                    for (int i = 0; i < min(pokemon.moves.length, 3); i++)
                      Text('${pokemon.moves[i]}'),
                  ],
                ),
                Text(AppConstants.home.moves),
              ],
            ),
          ],
        ),
        BlocBuilder<PokemonSpeciesCubit, PokemonSpeciesState>(
          bloc: speciesCubit,
          builder: (context, state) {
            if (state is PokemonSpeciesLoading) {
              return Center(child: CircularProgressIndicator());
            } else if (state is PokemonSpeciesError) {
              return Center(
                child: Text('${AppConstants.home.error} ${state.message}'),
              );
            } else if (state is PokemonSpeciesLoaded) {
              final species = state.species;
              return Column(
                children: [Text(species.flavorTexts[0].replaceAll('\n', ' '))],
              );
            }
            return Container();
          },
        ),
        Center(
          child: Text(
            AppConstants.home.baseStats,
            style: TextStyle(
              color: CoreUtils.getPokemonBackgroundColor("${pokemon.types[0]}"),
              fontSize: 18,
            ),
          ),
        ),
        Column(
          children: [
            for (int i = 0; i < pokemon.stats.length; i++)
              Row(
                children: [
                  Container(
                    height: 20,
                    width: 25,
                    child: Text('${(pokemon.stats[i].name)}'),
                  ),
                  Padding(
                    padding: EdgeInsets.only(left: 10),
                    child: Container(
                      width: 1,
                      height: 50,
                      color: Colors.grey, // Color gris para el divisor
                    ),
                  ),
                  Text('${pokemon.stats[i].baseStat}'),
                  Spacer(),
                  Padding(
                    padding: EdgeInsets.only(left: 10),
                    child: SizedBox(
                      width: 250,
                      height: 15,
                      child: StepProgressIndicator(
                        totalSteps: 1000,
                        currentStep: pokemon.stats[i].baseStat,
                        size: 8,
                        padding: 0,
                        selectedColor: Colors.yellow,
                        unselectedColor: Colors.cyan,
                        roundedEdges: Radius.circular(10),
                        selectedGradientColor: LinearGradient(
                          begin: Alignment.topLeft,
                          end: Alignment.bottomRight,
                          colors: [
                            CoreUtils.getPokemonBackgroundColor(
                              "${pokemon.types[0]}",
                            ),
                            CoreUtils.getPokemonBackgroundColor(
                              "${pokemon.types[0]}",
                            ),
                          ],
                        ),
                        unselectedGradientColor: LinearGradient(
                          begin: Alignment.topLeft,
                          end: Alignment.bottomRight,
                          colors: [
                            CoreUtils.getPokemonBackgroundColor(
                              "${pokemon.types[0]}",
                            ).withOpacity(0.3),
                            CoreUtils.getPokemonBackgroundColor(
                              "${pokemon.types[0]}",
                            ).withOpacity(0.3),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
          ],
        ),
      ],
    );
  }
}
