import 'package:core_module/core_module.dart';
import 'package:poke_app/src/App/Features/Home/data/models/pokemon_model.dart';
import 'package:poke_app/src/AtomicModel-UI/module_ui.dart';

part 'state/favorite_state.dart';

class FavoriteCubit extends Cubit<FavoriteState> {
  FavoriteCubit() : super(FavoriteInitial());

  final prefs = StorageCoreService.instance.prefs;



  PokemonModel getStatus(String id, final PokemonModel pokemon, int index) {
    bool status = prefs.getValue(key: id, type: StorageDataType.bool) ?? false;
    if (status) {}
    pokemon.favorite = status;
    return pokemon;
  }

  List<String> getFavoriteList() {
    return prefs.getValue(key: 'fav', type: StorageDataType.list) ?? [];
  }
}
