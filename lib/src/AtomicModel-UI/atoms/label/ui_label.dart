import 'package:poke_app/src/AtomicModel-UI/module_ui.dart';

class UILabel extends StatelessWidget {
  final String text;
  final AlignmentGeometry alignment;
  final double left;
  final double right;
  final double top;
  final double bottom;
  final double fontSize;
  final bool isLinkedText;
  final Color textColor;

  const UILabel({
    super.key,
    required this.text,
    this.alignment = Alignment.centerLeft,
    this.left = 0,
    this.right = 0,
    this.top = 0,
    this.bottom = 0,
    this.fontSize = 14,
    this.isLinkedText = false,
    this.textColor = Colors.black,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: alignment,
      child: Padding(
        padding:
            EdgeInsets.only(left: left, right: right, top: top, bottom: bottom),
        child: Stack(
          children: [
            // Texto principal
            Align(
              alignment: alignment,
              child: Text(
                text,
                style: TextStyle(
                  fontSize: fontSize,
                  fontWeight: FontWeight.bold,
                  color: textColor
                ),
              ),
            ),
            // Subrayado con guiones
            if (isLinkedText)
              Positioned(
                bottom: -8,
                // Ajusta la posición para que el subrayado quede cerca del texto
                child: Align(
                  alignment: alignment,
                  child: Text(
                    '-' * text.length,
                    // Genera la cantidad de guiones necesaria
                    style: TextStyle(
                      fontSize: fontSize,
                      color: Colors.black,
                      letterSpacing: 3, // Ajusta el espacio entre los guiones
                    ),
                  ),
                ),
              ),
          ],
        ),
      ),
    );
  }
}
