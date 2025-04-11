

import 'package:poke_app/src/AtomicModel-UI/module_ui.dart';

class UIMenuButton extends StatelessWidget {
  final String path;
  final Function() callback;
  final String name;
  final String? package;

  const UIMenuButton({
    super.key,
    required this.path,
    required this.callback,
    required this.name,
    this.package
  });

  Widget buttonElement(
          String type, final Function() handleAction, String name) =>
      InkWell(
          onTap: () {
            callback();
          },
          child: Column(
            children: [
              Card(
                elevation: 4.0,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(UISpacing.spacingS_15),
                ),
                color: Colors.white,//UIColorPalette.primaryWhite,
                child: SizedBox(
                  height: 100,//UISpacing.spacingXXL_64,//controlar el tamaño del widget
                  width: 100,//UISpacing.spacingXXL_64,
                  child: Padding(
                    padding: const EdgeInsets.all(UISpacing.spacingS_15),
                    child: SvgPicture.asset(
                      package: package,
                      path,
                    ),
                  ),
                ),
              ),
              Text(
                name,
                textAlign: TextAlign.center,
                style: UITextStyles.contentXXSMedium_8.copyWith(fontWeight: FontWeight.w600,),
              ),
            ],
          ));

  @override
  Widget build(BuildContext context) {
    return
      Stack(
        children: [
          Container(
            color: Colors.transparent,
            child: buttonElement(path, callback, name),
          ),
          Positioned(
            top: 8,
            left: 10,
            child: Container(
              width: 12,
              height: 12,
              decoration: BoxDecoration(
                color: Colors.green,
                shape: BoxShape.circle,
              ),
            ),
          ),
        ],
      );
  }
}
