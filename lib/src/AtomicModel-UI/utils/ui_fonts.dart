import 'package:poke_app/src/AtomicModel-UI/module_ui.dart';

abstract class UITextStyles {

  static final TextStyle contentSmall_10 = GoogleFonts.readexPro(
    fontSize: 16,
    fontWeight: FontWeight.w400,
    letterSpacing: 0.0,
  );

  static final TextStyle headlineH1_36 = GoogleFonts.readexPro(
    fontSize: 36,
    fontWeight: FontWeight.w700,
    letterSpacing: 0.25,
  );
  static final TextStyle contentXXLRegular_36 = GoogleFonts.readexPro(
    fontSize: 36,
    fontWeight: FontWeight.w400,
    letterSpacing: 0.25,
  );

  static final TextStyle headlineH2_28 = GoogleFonts.readexPro(
    fontSize: 28,
    fontWeight: FontWeight.w700,
    letterSpacing: 0.25,
  );
  static final TextStyle headlineH3_24 = GoogleFonts.readexPro(
    fontSize: 24,
    fontWeight: FontWeight.w600,
    letterSpacing: 0.25,
  );
  static final TextStyle contentXLRegular_24 = GoogleFonts.readexPro(
    fontSize: 24,
    fontWeight: FontWeight.w400,
    letterSpacing: 0.25,
  );

  static final TextStyle headlineH4_22 = GoogleFonts.readexPro(
    fontSize: 22,
    fontWeight: FontWeight.w500,
    letterSpacing: 0.25,
  );
  static final TextStyle headlineH2_20 = GoogleFonts.readexPro(
    fontSize: 20,
    fontWeight: FontWeight.w700,
    letterSpacing: 0.25,
  );
  static final TextStyle headlineH5_20 = GoogleFonts.readexPro(
    fontSize: 20,
    fontWeight: FontWeight.w500,
    letterSpacing: 0.25,
  );
  static final TextStyle headlineH6_18 = GoogleFonts.readexPro(
    fontSize: 18,
    fontWeight: FontWeight.w500,
    letterSpacing: 0.25,
  );
  static final TextStyle contentLBold_16 = GoogleFonts.readexPro(
    fontSize: 16,
    fontWeight: FontWeight.w700,
    letterSpacing: 0.25,
  );

  static final TextStyle contentLMedium_16 = GoogleFonts.readexPro(
    fontSize: 16,
    fontWeight: FontWeight.w500,
    letterSpacing: 0.0,
    color: UIColorPalette.letterInput
  );
  static final TextStyle subtituloMedium_14 = GoogleFonts.readexPro(
    fontSize: 14,
    fontWeight: FontWeight.w500,
  );
  static final TextStyle subtituloMedium_16 = GoogleFonts.readexPro(
    fontSize: 16,
    fontWeight: FontWeight.w500,
    letterSpacing: 0.25,
  );
  static final TextStyle contentLRegular_16 = GoogleFonts.readexPro(
    fontSize: 16,
    fontWeight: FontWeight.w400,
    letterSpacing: 0.25,
  );

  static final TextStyle contentMSemibold_14 = GoogleFonts.readexPro(
    fontSize: 14,
    fontWeight: FontWeight.w600,
    letterSpacing: 0.0,
  );
  static final TextStyle contentMMedium_14 = GoogleFonts.readexPro(
    fontSize: 14,
    fontWeight: FontWeight.w500,
    letterSpacing: 0.25,
  );
  static final TextStyle contentMRegular_14 = GoogleFonts.readexPro(
    fontSize: 14,
    fontWeight: FontWeight.w400,
    letterSpacing: 0.25,
  );
  static final TextStyle contentMRegular_16 = GoogleFonts.readexPro(
    fontSize: 16,
    fontWeight: FontWeight.w400,
    letterSpacing: 0.25,
  );
  static final TextStyle contentSSemibold_12 = GoogleFonts.readexPro(
    fontSize: 12,
    fontWeight: FontWeight.w600,
    letterSpacing: 0.25,
  );
  static final TextStyle contentSMedium_12 = GoogleFonts.readexPro(
      fontSize: 12,
      fontWeight: FontWeight.w500,
      letterSpacing: 0.25,
      color: Colors.green);
  static final TextStyle contentSRegular_12 = GoogleFonts.readexPro(
    fontSize: 12,
    fontWeight: FontWeight.w400,
    letterSpacing: 0.25,
  );
  static final TextStyle contentSRegularAuto_12 = GoogleFonts.readexPro(
    fontSize: 12,
    fontWeight: FontWeight.w400,
    letterSpacing: 0.25,
  );
  static final TextStyle contentSRegularUnderline_12 = GoogleFonts.readexPro(
    fontSize: 12,
    fontWeight: FontWeight.w400,
    letterSpacing: 0.25,
  );
  static final TextStyle contentXSRegular_10 = GoogleFonts.readexPro(
    fontSize: 10,
    fontWeight: FontWeight.w400,
    letterSpacing: 0.25,
  );
  static final TextStyle contentXXSMedium_8 = GoogleFonts.readexPro(
    fontSize: 8,
    fontWeight: FontWeight.w500,
    letterSpacing: 0.25,
  );
  static final TextStyle contentNunitoSSemibold_12 = GoogleFonts.nunitoSans(
    fontSize: 14,
    fontWeight: FontWeight.w600,
    letterSpacing: 0.25,
  );

  static TextStyle add(TextStyle style, [Color? color, double? height]) {
    return GoogleFonts.readexPro(
        fontSize: style.fontSize,
        fontWeight: style.fontWeight,
        letterSpacing: style.letterSpacing,
        color: color,
        height: height);
  }

  static final TextStyle contentLMedium = GoogleFonts.readexPro(
    fontSize: 16,
    fontWeight: FontWeight.w500,
    letterSpacing: 0.25,
  );

  static final TextStyle contentXSRegular_12 = GoogleFonts.readexPro(
    fontSize: 12,
    fontWeight: FontWeight.w500,
    letterSpacing: 0.25,
  );

  static final TextStyle subTitleMovements = GoogleFonts.readexPro(
    color: const Color(0xFF2D6DDD),
    fontSize: 12,
    fontWeight: FontWeight.w400,
    height: 0.12,
    letterSpacing: 0.25,
  );
}
