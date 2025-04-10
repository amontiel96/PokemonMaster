import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter/foundation.dart' show kIsWeb;
import 'package:poke_app/src/AtomicModel-UI/module_ui.dart';

enum UIBgType {
  exterior,
  home,
  large,
  medium,
  small,
  extraSmall,
  circle,
  dynamicSmall,
  dynamicMedium,
  dynamicLarge,
}

class UIBackground extends StatelessWidget {
  final UIBgType type;
  final Color color;

  const UIBackground({required this.type, super.key, required this.color});

  @override
  Widget build(BuildContext context) {
    double height;
    final double dynamicHeight = MediaQuery.of(context).size.height;

    switch (type) {
      case UIBgType.exterior:
        height = 272;
        break;
      case UIBgType.home:
        height = 136;
        break;
      case UIBgType.large:
        height = 288;
        break;
      case UIBgType.medium:
        height = kIsWeb ? 110 : 184;
        break;
      case UIBgType.small:
        height = kIsWeb ? 80 : 112;
        break;
      case UIBgType.extraSmall:
        height = kIsWeb ? 50 : 80;
        break;
      case UIBgType.dynamicMedium:
        height = dynamicHeight * 0.18;
        break;
      case UIBgType.dynamicSmall:
        height = dynamicHeight * 0.18;
        break;
      case UIBgType.dynamicLarge:
        height = dynamicHeight * 0.25;
        break;

      case UIBgType.circle:
        return SvgPicture.asset(
          package: 'poke_app',
          '.svg',
          width: MediaQuery.of(context).size.width,
        );
    }
    return CustomPaint(
      painter: _CurvedHeaderPainter(color),
      child: SizedBox(
        width: MediaQuery.of(context).size.width,
        height: height + kToolbarHeight - UISpacing.spacingL_24,
      ),
    );
  }
}


class _CurvedHeaderPainter extends CustomPainter {
  final Color color;

  _CurvedHeaderPainter(this.color);
  @override
  void paint(Canvas canvas, Size size) {
    final rect = Rect.fromLTWH(0, 0, size.width, size.height);

    final paint = Paint()
      ..shader =  LinearGradient(
        begin: Alignment.topCenter,
        end: Alignment.bottomCenter,
        stops: [
          0.07,
          0.15,
          0.50,
        ],
        colors: [
          color,
          color,
          color,
        ],
      ).createShader(rect);

    const borderRadius = UISpacing.spacingXL_32;

    final path = Path()
      ..moveTo(0, 0) // Empieza en la esquina superior izquierda
      ..lineTo(0, size.height - borderRadius) // Línea hacia abajo
      ..quadraticBezierTo(-0, size.height, borderRadius, size.height) // Curva hacia la esquina inferior izquierda
      ..lineTo(size.width - borderRadius, size.height) // Línea horizontal hacia la esquina inferior derecha
      ..quadraticBezierTo(size.width, size.height, size.width, size.height - borderRadius) // Curva hacia la esquina inferior derecha
      ..lineTo(size.width, 0) // Línea hacia la parte superior derecha
      ..close(); // Cierra el camino

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return false;
  }
}


