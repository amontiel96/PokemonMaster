import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:poke_app/src/AtomicModel-UI/utils/assets/ui_assets.dart';
import '../../utils/ui_spacing.dart';
part 'package:poke_app/src/AtomicModel-UI/atoms/validations/data/ui_validations_enum.dart';

class UIValidations extends StatelessWidget {
  final UIValidation validationType;
  final double size;
  const UIValidations({
    required this.validationType,
    super.key,
    this.size = -1,
  });

  /// Obtains different default size for type of validation image.
  double getSize(UIValidation validation) {
    if (((validation.name == 'confirmation' ||
            validation.name == 'error' ||
            validation.name == 'activation' ||
            validation.name == 'process' ||
            validation.name == 'sms') &&
        size == -1)) {
      return UISpacing.spacingXXL_64;
    }
    if ((!(validation.name == 'confirmation' || validation.name == 'error') &&
        size == -1)) {
      return UISpacing.spacingM_16;
    }
    return size;
  }

  @override
  Widget build(BuildContext context) {
    return SvgPicture.asset(
      validationType.type,
      height: getSize(validationType),
      //package: 'poke_app',
    );
  }
}
