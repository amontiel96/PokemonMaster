import 'package:poke_app/src/AtomicModel-UI/module_ui.dart';

class UIInputSearch extends StatelessWidget {
  final String? hint;
  final bool enabled;
  final TextEditingController? controller;
  final bool autofocus;
  final Function(String)? onChanged;
  final Function()? onClose;
  final Function()? onTap;
  final InputBorder? border;
  final InputDecoration? decoration;
  final FocusNode? focusNode;
  final double left;
  final double right;
  final double top;
  final double bottom;
  final AlignmentGeometry alignment;
  final String? label;
  final TextStyle? textStyle;

  const UIInputSearch({
    this.controller,
    this.hint,
    super.key,
    this.enabled = true,
    this.autofocus = false,
    this.onChanged,
    this.onClose,
    this.onTap,
    this.decoration,
    this.border,
    this.focusNode,
    this.left = 0,
    this.right = 0,
    this.top = 0,
    this.bottom = 0,
    this.alignment = Alignment.centerLeft,
    this.label,
    this.textStyle,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: alignment,
      child: Padding(
        padding: EdgeInsets.only(
          left: left,
          right: right,
          top: top,
          bottom: bottom,
        ),
        child: TextFormField(
          focusNode: focusNode,
          enabled: enabled,
          controller: controller,
          autofocus: autofocus,
          style: textStyle ?? UITextStyles.contentLMedium_16,
          decoration:
              decoration ??
              InputDecoration(
                labelText: label,
                prefixIcon: const Icon(Icons.search),
                suffixIcon:
                    controller != null
                        ? controller!.text.isNotEmpty
                            ? InkWell(child: Icon(Icons.close), onTap: onClose)
                            : null
                        : null,
                suffixIconColor: UIColorPalette.backgroundColor,
                prefixIconColor: UIColorPalette.backgroundColor,
                hintText: hint,
                hintStyle: _decorationHintStyle(),
                border:
                    border ??
                    OutlineInputBorder(
                      borderSide: const BorderSide(
                        color: Colors.white,
                        style: BorderStyle.none,
                        width: 0,
                      ),
                      borderRadius: BorderRadius.circular(
                        UISpacing.spacingXL_32,
                      ),
                    ),
                focusedBorder: border ?? _decorationInputEnable(),
                contentPadding: const EdgeInsets.symmetric(
                  vertical: 0,
                  horizontal: 15,
                ),
                errorStyle: UITextStyles.contentSRegular_12.copyWith(
                  color: UIColorPalette.stateRed,
                ),
                filled: true,
                fillColor:
                    enabled
                        ? UIColorPalette.primaryColorLetter
                        : UIColorPalette.primaryGreyTab,
              ),
          cursorColor: UIColorPalette.letterInput,
          keyboardType: TextInputType.text,
          onChanged: onChanged,
          onTap: onTap,
        ),
      ),
    );
  }

  TextStyle? _decorationHintStyle() => UITextStyles.add(
    UITextStyles.contentLRegular_16,
    UIColorPalette.secondaryGreyDisabled,
  );

  InputBorder _decorationInputEnable() {
    return OutlineInputBorder(
      borderSide: const BorderSide(
        color: UIColorPalette.primaryColorLetter,
        style: BorderStyle.none,
      ),
      borderRadius: BorderRadius.circular(UISpacing.spacingXL_32),
    );
  }
}
