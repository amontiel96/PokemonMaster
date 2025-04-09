import 'package:poke_app/src/AtomicModel-UI/module_ui.dart';

class UIPrimaryButton extends StatelessWidget {
  final String text;
  final String? assetIconName;
  final VoidCallback? onPressed;
  final OutlinedBorder? enabledShape;
  final OutlinedBorder? disabledShape;
  final Size? minimumSize;
  final MaterialStateProperty<double?>? elevation;
  final Widget? childWidget;
  final bool? enabled;
  final double left;
  final double right;
  final double top;
  final double bottom;
  final AlignmentGeometry alignment;

  const UIPrimaryButton({
    required this.text,
    this.assetIconName,
    this.onPressed,
    this.enabledShape,
    this.disabledShape,
    this.minimumSize,
    this.elevation,
    this.childWidget,
    this.enabled = true,
    this.left = 0,
    this.right = 0,
    this.top = 0,
    this.bottom = 0,
    this.alignment = Alignment.center,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return _GeneralButton(
      text: text,
      assetIconName: assetIconName,
      onPressed: onPressed,
      enabledColor: (enabled != null && !enabled!)
          ? UIColorPalette.secondarySpaceCadetLight
          : UIColorPalette.textCharcoal2,
      disabledColor: UIColorPalette.secondarySpaceCadetLight,
      enabledTextColor: (enabled != null && !enabled!)
          ? UIColorPalette.primaryWhite
          : UIColorPalette.primaryWhite,
      disabledTextColor: UIColorPalette.primaryWhite,
      enabledShape: enabledShape ??
          RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(UISpacing.spacingS_14),
            side: BorderSide.none,
          ),
      disabledShape: disabledShape ??
          RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(UISpacing.spacingS_14),
            side: BorderSide.none,
          ),
      minimumSize: minimumSize ??
          const Size.fromHeight(
            UISpacing.spacingXXL_48,
          ),
      elevation: elevation ?? MaterialStateProperty.all(0),
      childWidget: childWidget,
      left: left,
      right: right,
      top: top,
      bottom: bottom,
      alignment: alignment,
    );
  }
}

class UISecondaryButton extends StatelessWidget {
  final String text;
  final String? assetIconName;
  final VoidCallback? onPressed;
  final OutlinedBorder? enabledShape;
  final OutlinedBorder? disabledShape;
  final Size? minimumSize;
  final IconData? preIcon;
  final double left;
  final double right;
  final double top;
  final double bottom;
  final MaterialStateProperty<double?>? elevation;
  final AlignmentGeometry alignment;

  const UISecondaryButton({
    required this.text,
    this.assetIconName,
    this.onPressed,
    this.enabledShape,
    this.disabledShape,
    this.minimumSize,
    this.elevation,
    this.preIcon,
    this.left = 0,
    this.right = 0,
    this.top = 0,
    this.bottom = 0,
    this.alignment = Alignment.center,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return _GeneralButton(
      key: key,
      text: text,
      assetIconName: assetIconName,
      onPressed: onPressed,
      enabledColor: UIColorPalette.trainColorSecondaryBtn,
      disabledColor: UIColorPalette.primaryWhite,
      enabledTextColor: UIColorPalette.primaryWhite,
      disabledTextColor: UIColorPalette.secondarySpaceCadetLight,
      enabledShape: enabledShape ??
          RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(UISpacing.spacingS_14),
            side: const BorderSide(
              color: UIColorPalette.primaryWhite,
              width: 1,
            ),
          ),
      disabledShape: disabledShape ??
          RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(UISpacing.spacingS_14),
            side: const BorderSide(
              color: UIColorPalette.secondarySpaceCadetLight,
              width: 2,
            ),
          ),
      minimumSize: minimumSize ??
          const Size.fromHeight(
            UISpacing.spacingXXL_48,
          ),
      preIcon: this.preIcon,
      elevation: elevation ?? MaterialStateProperty.all(0),
      left: left,
      right: right,
      top: top,
      bottom: bottom,
      alignment: alignment,
    );
  }
}

class UITertiaryButton extends StatelessWidget {
  final String text;
  final String? assetIconName;
  final VoidCallback? onPressed;
  final OutlinedBorder? enabledShape;
  final OutlinedBorder? disabledShape;
  final Size? minimumSize;
  final MaterialStateProperty<double?>? elevation;
  final IconData? preIcon;
  final Color? enabledColor;
  final double left;
  final double right;
  final double top;
  final double bottom;
  final AlignmentGeometry alignment;

  const UITertiaryButton({
    required this.text,
    this.assetIconName,
    this.onPressed,
    this.enabledShape,
    this.disabledShape,
    this.minimumSize,
    this.elevation,
    this.preIcon,
    this.enabledColor,
    this.left = 0,
    this.right = 0,
    this.top = 0,
    this.bottom = 0,
    this.alignment = Alignment.center,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return _GeneralButton(
      key: key,
      text: text,
      assetIconName: assetIconName,
      onPressed: onPressed,
      enabledColor: enabledColor ?? UIColorPalette.primaryWhite,
      disabledColor: UIColorPalette.primaryWhite,
      enabledTextColor: UIColorPalette.primarySpaceCadet,
      disabledTextColor: UIColorPalette.secondarySpaceCadetLight,
      enabledShape: enabledShape ??
          RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(UISpacing.spacingS_14),
            side: BorderSide.none,
          ),
      disabledShape: disabledShape ??
          RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(UISpacing.spacingS_14),
            side: BorderSide.none,
          ),
      minimumSize: minimumSize ??
          const Size.fromHeight(
            UISpacing.spacingXXL_48,
          ),
      elevation: elevation ?? MaterialStateProperty.all(0),
      preIcon: preIcon,
      left: left,
      right: right,
      top: top,
      bottom: bottom,
      alignment: alignment,
    );
  }
}

class _GeneralButton extends StatelessWidget {
  final String text;
  final VoidCallback? onPressed;
  final String? assetIconName;
  final Color enabledColor;
  final Color disabledColor;
  final Color enabledTextColor;
  final Color disabledTextColor;
  final OutlinedBorder enabledShape;
  final OutlinedBorder disabledShape;
  final Size minimumSize;
  final MaterialStateProperty<double?>? elevation;
  final IconData? preIcon;
  final Widget? childWidget;
  final double left;
  final double right;
  final double top;
  final double bottom;
  final AlignmentGeometry alignment;

  const _GeneralButton({
    required this.text,
    required this.onPressed,
    required this.assetIconName,
    required this.enabledColor,
    required this.disabledColor,
    required this.enabledTextColor,
    required this.disabledTextColor,
    required this.enabledShape,
    required this.disabledShape,
    required this.minimumSize,
    required this.elevation,
    this.childWidget,
    this.preIcon,
    this.alignment = Alignment.center,
    super.key,
    required this.left,
    required this.right,
    required this.top,
    required this.bottom,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: alignment,
      child: Padding(
        padding:
            EdgeInsets.only(left: left, right: right, top: top, bottom: bottom),
        child: ElevatedButton(
          style: ButtonStyle(
            elevation: elevation,
            backgroundColor: MaterialStateProperty.resolveWith<Color>(
                (Set<MaterialState> states) {
              if (states.contains(MaterialState.disabled)) {
                return disabledColor;
              }
              return enabledColor;
            }),
            foregroundColor: MaterialStateProperty.resolveWith<Color>((states) {
              if (states.contains(MaterialState.disabled)) {
                return disabledTextColor;
              }
              return enabledTextColor;
            }),
            shape: MaterialStateProperty.resolveWith<OutlinedBorder>((states) {
              if (states.contains(MaterialState.disabled)) {
                return disabledShape;
              }
              return enabledShape;
            }),
            padding: MaterialStateProperty.all(
              const EdgeInsets.all(0.0),
            ),
            minimumSize: MaterialStateProperty.all(minimumSize),
          ),
          child: assetIconName == null
              ? preIcon == null
                  ? childWidget == null
                      ? Text(
                          text,
                          style: UITextStyles.contentMSemibold_14
                              .copyWith(height: 0),
                        )
                      : childWidget!
                  : buildTextAndIcon(preIcon!)
              : buildTextAndImage(assetIconName!),
          onPressed: onPressed,
        ),
      ),
    );
  }

  Widget buildTextAndImage(String assetIconName) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        UIAssetImage(
          path: assetIconName,
          size: const Size.square(UISpacing.spacingL_24),
          color: onPressed != null ? enabledTextColor : disabledTextColor,
        ),
        const SizedBox(
          width: UISpacing.spacingXS_8,
        ),
        Text(
          text,
          style: UITextStyles.contentMSemibold_14.copyWith(height: 0),
        ),
      ],
    );
  }

  Widget buildTextAndIcon(IconData? preIcon) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Icon(
          preIcon,
          color: onPressed != null ? enabledTextColor : disabledTextColor,
        ),
        const SizedBox(
          width: UISpacing.spacingXS_8,
        ),
        Text(
          text,
          style: UITextStyles.contentMSemibold_14.copyWith(height: 0),
        ),
      ],
    );
  }
}
