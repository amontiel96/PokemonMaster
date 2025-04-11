import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class TDSMAssetImage extends StatelessWidget {
  final String path;
  final Size? size;
  final Color? color;
  final BoxFit? fit;

  const TDSMAssetImage({
    required this.path,
    this.size,
    this.color,
    this.fit,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return path.endsWith('.svg')
        ? SvgPicture.asset(
            package: 'poke_app',
            path,
            color: color,
            width: size?.width,
            height: size?.height,
          )
        : Image.asset(
            package: 'poke_app',
            path,
            color: color,
            width: size?.width,
            height: size?.height,
            fit: fit,
          );
  }
}
