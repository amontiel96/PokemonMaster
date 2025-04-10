import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class TDSMLogosSquare extends StatelessWidget {
  final String logo;
  final double width;
  final double height;
  const TDSMLogosSquare({
    required this.logo,
    this.width = 100,
    this.height = 100,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SvgPicture.asset(
      package: 'poke_app',
      logo,
      key: key,
      width: width,
      height: height,
      fit: BoxFit.fill,
    );
  }
}
