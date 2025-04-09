import 'package:poke_app/src/AtomicModel-UI/module_ui.dart';

class UIAssetImage extends StatelessWidget {
  final String path;
  final Size? size;
  final Color? color;
  final BoxFit? fit;
  final double left;
  final double right;
  final double top;
  final double bottom;
  final AlignmentGeometry alignment;
  final String? package;

  const UIAssetImage({
    required this.path,
    this.size,
    this.color,
    this.fit,
    this.left = 0,
    this.right = 0,
    this.top = 0,
    this.bottom = 0,
    this.alignment = Alignment.center,
    this.package,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return
      Container(
        alignment: alignment,
      child: Padding(
        padding:
        EdgeInsets.only(left: left, right: right, top: top, bottom: bottom),
        child: path.endsWith('.svg')
            ? SvgPicture.asset(
          package: package,
          path,
          color: color,
          width: size?.width,
          height: size?.height,
        )
            : Image.asset(
          package: package,
          path,
          color: color,
          width: size?.width,
          height: size?.height,
          fit: fit,
        ),
      ),
      )
        ;
  }
}
