import 'package:core_module/core_module.dart';
import 'package:poke_app/src/App/Features/Home/data/models/user_info_model.dart';
import 'package:poke_app/src/AtomicModel-UI/module_ui.dart';

part 'state/home_main_state.dart';

class HomeMainCubit extends Cubit<HomeMainState> {
  HomeMainCubit() : super(HomeMainInitial());

  late UserAccountModel userAccount;

  void listenerUserAccount() {
    emit(HomeMainInitial());
    _dataListener();
  }

  void _dataListener() async {
    User? user = FirebaseService.instance.getUser();
    final userinfo = FirebaseDatabase.instance.ref(
      '${FirebasePathsConstant().users}/${user!.uid}',
    );
    userinfo.onValue.listen((onData) {
      final data = onData.snapshot.value;
      if (data is Map) {
        Map<String, dynamic> userMap = Map<String, dynamic>.from(data);
        userAccount = UserAccountModel.fromJson(userMap);
      } else {
        print("El formato de 'data' no es un Map válido");
      }

      emit(HomeMainLoaded(isSuccess: data != null));
    });
  }
}
