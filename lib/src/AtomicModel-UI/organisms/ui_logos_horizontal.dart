import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class TDSMLogosHorizontal extends StatelessWidget {
  final String logo;
  final double width;
  final double height;
  const TDSMLogosHorizontal({
    required this.logo,
    this.width = double.infinity,
    this.height = 100,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SvgPicture.asset(
      package: 'desingsystem',
      logo,
      key: key,
      width: width,
      height: height,
      fit: BoxFit.contain,
    );
  }
}
