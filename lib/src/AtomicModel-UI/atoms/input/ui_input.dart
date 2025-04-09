import 'package:poke_app/src/AtomicModel-UI/module_ui.dart';

class UIInput extends StatelessWidget {
  final String? initialValue;
  final String? label;
  final String? hint;
  final String? error;
  final int maxLines;
  final int errorMaxLines;
  final int? maxCounter;
  final bool enabled;
  final bool inactive;
  final bool obscureText;
  final TextEditingController? controller;
  final String? Function(String?)? validator;
  final Widget? suffix;
  final Widget? prefix;
  final Function()? callBack;
  final Function(String)? onChanged;
  final Widget? suffixIcon;
  final double errorStyleHeight;
  final TextInputAction textInputAction;
  final EdgeInsetsGeometry? inputDecorationPadding;
  final TextInputType keyboardType;
  final List<TextInputFormatter>? inputFormatters;
  final FocusNode? focusNode;
  final int? minLines;
  final String obscuringCharacter;
  final AutovalidateMode? autovalidateMode;
  final TextStyle? textStyle;
  final String? helperText;
  final bool autofocus;
  final TextAlign? textAlign;
  final Function(PointerDownEvent)? onTapOutside;
  final double left;
  final double right;
  final double top;
  final double bottom;

  const UIInput({
    this.initialValue,
    this.label,
    this.hint,
    this.error,
    this.controller,
    this.enabled = true,
    this.inactive = false,
    this.maxLines = 1,
    this.errorMaxLines = 1,
    this.maxCounter,
    this.validator,
    this.obscureText = false,
    this.suffix,
    this.callBack,
    this.prefix,
    this.onChanged,
    this.suffixIcon,
    this.errorStyleHeight = 1.40,
    this.textInputAction = TextInputAction.done,
    this.keyboardType = TextInputType.multiline,
    this.inputFormatters,
    this.inputDecorationPadding,
    this.focusNode,
    this.minLines,
    this.autovalidateMode,
    this.textStyle,
    this.obscuringCharacter = '•',
    this.autofocus = false,
    this.helperText,
    this.textAlign = TextAlign.start,
    this.onTapOutside,
    this.left = 0,
    this.right = 0,
    this.top = 0,
    this.bottom = 0,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding:
            EdgeInsets.only(left: left, right: right, top: top, bottom: bottom),
        child: TextFormField(
          initialValue: initialValue,
          autofocus: autofocus,
          focusNode: focusNode,
          enabled: enabled,
          controller: controller,
          obscureText: obscureText,
          readOnly: callBack != null,
          onTap: callBack,
          textInputAction: textInputAction,
          style: textStyle,
          textAlign: textAlign ?? TextAlign.start,
          textAlignVertical: TextAlignVertical.top,
          minLines: minLines,
          decoration: InputDecoration(
            alignLabelWithHint: true,
            suffixIcon: suffixIcon,
            suffix: suffix,
            prefix: prefix,
            hintText: hint,
            helperText: helperText,
            labelText: label,
            errorText: error,
            hintStyle: _decorationHintStyle(),
            labelStyle: UITextStyles.contentMRegular_16.copyWith(
              color: error == null
                  ? UIColorPalette.secondaryGreyInput
                  : UIColorPalette.trainColorPrimaryTxtHolder,
            ),
            disabledBorder: _decorationInputDisabled(),
            enabledBorder: _decorationInputEnable(inactive: inactive),
            errorBorder: _decorationInputError(),
            focusedErrorBorder: _decorationInputError(),
            border: _decorationInputEnable(),
            focusedBorder: _decorationInputEnable(),
            contentPadding: inputDecorationPadding ??
                const EdgeInsets.symmetric(
                  vertical: 15,
                  horizontal: 15,
                ),
            errorStyle: UITextStyles.contentSRegular_12.copyWith(
              color: UIColorPalette.stateRed,
              height: errorStyleHeight,
            ),
            errorMaxLines: errorMaxLines,
            filled: true,
            fillColor: Colors.transparent, // color fondo dentro del input
          ),
          validator: validator,
          maxLength: maxCounter,
          maxLines: obscureText ? 1 : maxLines,
          cursorColor: UIColorPalette.secondaryGreyInput,
          autovalidateMode:
              autovalidateMode ?? AutovalidateMode.onUserInteraction,
          keyboardType: keyboardType,
          onChanged: onChanged,
          inputFormatters: inputFormatters,
          obscuringCharacter: obscuringCharacter,
          onTapOutside: onTapOutside,
        ));
  }

  TextStyle? _decorationHintStyle() => UITextStyles.add(
        UITextStyles.contentLRegular_16,
        UIColorPalette.secondaryGreyDisabled,
      );

  InputBorder _decorationInputDisabled() => OutlineInputBorder(
        borderRadius: BorderRadius.circular(UISpacing.spacingM_16),
        borderSide: const BorderSide(
            color: UIColorPalette.secondaryGreyDisabled,
            style: BorderStyle.solid,
            width: 1),
      );

  InputBorder _decorationInputEnable({bool inactive = false}) =>
      OutlineInputBorder(
        borderRadius: BorderRadius.circular(UISpacing.spacingM_16),
        borderSide: BorderSide(
            color: (inactive)
                ? UIColorPalette.secondaryGreyInput
                : UIColorPalette.textCharcoal1,
            style: BorderStyle.solid,
            width: 1),
      );

  InputBorder _decorationInputError() => OutlineInputBorder(
        borderRadius: BorderRadius.circular(UISpacing.spacingM_16),
        borderSide: const BorderSide(
            color: UIColorPalette.stateRed, style: BorderStyle.solid, width: 1),
      );
}
