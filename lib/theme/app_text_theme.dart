import 'package:flutter_template/utils/export.dart';
import 'package:google_fonts/google_fonts.dart';

class AppTextTheme {
  AppTextTheme._();

  static TextTheme lightTextTheme = TextTheme(
    bodyMedium: TextStyle(
      fontSize: 14,
      fontFamily: "Effra",
      fontWeight: FontWeight.normal,
      color: CustomAppTheme.lightColors[AppColor.bodyColor1],
    ),
    bodyLarge: GoogleFonts.openSans(
      fontSize: 16,
      fontWeight: FontWeight.normal,
      color: CustomAppTheme.lightColors[AppColor.bodyColor1],
    ),
  );

  static TextTheme darkTextTheme = TextTheme(
    bodyMedium: TextStyle(
      fontSize: 14,
      fontFamily: "Effra",
      fontWeight: FontWeight.normal,
      color: CustomAppTheme.darkColors[AppColor.bodyColor1],
    ),
    bodyLarge: GoogleFonts.openSans(
      fontSize: 16,
      fontWeight: FontWeight.normal,
      color: CustomAppTheme.darkColors[AppColor.bodyColor1],
    ),
  );
}

extension GetTextStyle on BuildContext {
  TextStyle effraTextStyle() {
    return Theme.of(this).textTheme.bodyMedium ?? const TextStyle();
  }

  TextStyle openSansTextStyle() {
    return Theme.of(this).textTheme.bodyLarge ?? const TextStyle();
  }
}
