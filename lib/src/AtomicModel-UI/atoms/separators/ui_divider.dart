

import 'package:poke_app/src/AtomicModel-UI/module_ui.dart';

class UIDivider extends StatelessWidget{
  final Color color;
  final double thickness;
  final double indent;
  final double endIndent;

  const UIDivider({
    super.key,
    this.color = Colors.grey,
    this.thickness = 1,
    this.indent = 20,
    this.endIndent = 20
  });

  @override
  Widget build(BuildContext context) {
   return
     Divider(
       color: color, // Color de la línea
       thickness: thickness, // Grosor de la línea
       indent: indent, // Espaciado a la izquierda
       endIndent: endIndent, // Espaciado a la derecha
     );
  }

}