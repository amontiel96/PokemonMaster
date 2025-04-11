import 'package:poke_app/src/App/Features/Home/presentation/cubit/favorite_cubit.dart';
import 'package:poke_app/src/App/Features/Home/presentation/cubit/pokemon_cubit.dart';
import 'package:poke_app/src/AtomicModel-UI/module_ui.dart';

import '../../../../Core/constants/global_constants.dart';

class FavoriteSection extends StatelessWidget {
  FavoriteSection({super.key});

  final PokemonCubit _cubit = Modular.get<PokemonCubit>();

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: 600,
      child: ListView.builder(
        itemCount: _cubit.getFavoriteList().length,
        itemBuilder: (context, index) {
          String data = _cubit.getFavoriteList()[index];
          String id = data.split('#')[0];
          String name = data.split('#')[1];
          return Padding(
            padding: EdgeInsets.all(5),
            child: Card(
              color: Colors.white,
              child: ListTile(
                title: Text('Pokemon: $name'),
                subtitle: Text('Identificador: #$id'),
                leading: Image.network(
                  width: 55,
                  height: 55,
                  AppConstants.home.imgUrl.replaceAll('imgUrl', id),
                  fit: BoxFit.cover,
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
