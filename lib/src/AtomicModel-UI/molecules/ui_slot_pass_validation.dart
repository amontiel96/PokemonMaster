import 'package:flutter/material.dart';
import 'package:poke_app/src/AtomicModel-UI/atoms/validations/ui_validations.dart';

import '../utils/ui_colors_palette.dart';
import '../utils/ui_fonts.dart';
import '../utils/ui_spacing.dart';


class UISlotPassValidation extends StatelessWidget {
  final List<Map<String, dynamic>> items;
  final bool hasErrorMessage;
  final String errorMessage;
  final String title;
  const UISlotPassValidation({
    required this.items,
    required this.errorMessage,
    super.key,
    this.hasErrorMessage = false,
    this.title = '',
  });

  @override
  Widget build(BuildContext context) {
    UIValidation getIconState(int state) {
      switch (state) {
        case 1:
          return UIValidation.vDefault;
        case 2:
          return UIValidation.valid;
        case 3:
          return UIValidation.invalid;
      }
      return UIValidation.vDefault;
    }

    return Container(
      margin: const EdgeInsets.all(
        UISpacing.spacingXXS_4,
      ),
      padding: const EdgeInsets.all(
        UISpacing.spacingXS_8,
      ),
      decoration: const BoxDecoration(
        color: UIColorPalette.primaryWhite,
        boxShadow: [
          BoxShadow(
            color: UIColorPalette.secondaryGrayShadow,
            blurRadius: UISpacing.spacingS_12,
            spreadRadius: 0,
            offset: Offset(
              0,
              UISpacing.spacingXXS_4,
            ),
          )
        ],
      ),
      child: IntrinsicHeight(
        child: Column(
          children: [
            Align(
              alignment: Alignment.topLeft,
              child: Padding(
                padding: const EdgeInsets.only(
                  bottom: UISpacing.spacingXS_8,
                ),
                child: Text(
                  title,
                  style: UITextStyles.contentSRegular_12.copyWith(
                    color: UIColorPalette.trainColorPrimaryTxt,
                  ),
                  textAlign: TextAlign.start,
                ),
              ),
            ),
            for (int i = 0; i < items.length; i++)
              Padding(
                padding: const EdgeInsets.only(
                  bottom: UISpacing.spacingXS_8,
                ),
                child: Row(
                  children: [
                    UIValidations(
                      validationType: getIconState(items[i]['state']),
                    ),
                    const SizedBox(
                      width: UISpacing.spacingXS_8,
                    ),
                    Expanded(
                      child: Wrap(
                        alignment: WrapAlignment.start,
                        children: [
                          Text(
                            items[i]['label'],
                            style: UITextStyles.contentSRegular_12.copyWith(
                              color: UIColorPalette.trainColorPrimaryTxt,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            hasErrorMessage
                ? Text(
                    errorMessage,
                    style: UITextStyles.contentSRegular_12.copyWith(
                      color: UIColorPalette.stateRed,
                    ),
                    textAlign: TextAlign.left,
                  )
                : const SizedBox(),
          ],
        ),
      ),
    );
  }
}
