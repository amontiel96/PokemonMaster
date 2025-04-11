import 'package:poke_app/src/AtomicModel-UI/module_ui.dart';
import 'package:poke_app/src/AtomicModel-UI/molecules/cards/data/ui_menu_model.dart';

class UICardMenu extends StatelessWidget {
  final int items;
  final List<UIMenuModel> categories;
  final Function(UIMenuModel) clickCategories;

  const UICardMenu({
    super.key,
    required this.items,
    required this.categories,
    required this.clickCategories,
  });

  @override
  Widget build(BuildContext context) {
    return
      GridView.builder(
        physics: const ClampingScrollPhysics(),
        shrinkWrap: true,
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 3,
          childAspectRatio: 0.79,//para controlar el tamaño de distancia abajo hacia arriba
        ),
        itemCount: items,
        itemBuilder: (context, index) {
          return Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            mainAxisSize: MainAxisSize.max,
            children: <Widget>[
              UIMenuButton(
                name: categories[index].label,
                path: categories[index].path,
                callback: () {
                  clickCategories(categories[index]);
                },
              ),
            ],
          );
        },
      );
      //original
      Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(UISpacing.spacingS_15),
      ),
      color: UIColorPalette.backgroundContainer,
      child: Padding(
        padding: const EdgeInsets.all(UISpacing.spacingXS_10),//pading hacia adentro de los widgets adentro del card principal
        child: GridView.builder(
          physics: const ClampingScrollPhysics(),
          shrinkWrap: true,
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 3,
            childAspectRatio: 0.79,//para controlar el tamaño de distancia abajo hacia arriba
          ),
          itemCount: items,
          itemBuilder: (context, index) {
            return Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              mainAxisSize: MainAxisSize.max,
              children: <Widget>[
                UIMenuButton(
                  name: categories[index].label,
                  path: categories[index].path,
                  callback: () {
                    clickCategories(categories[index]);
                  },
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}
