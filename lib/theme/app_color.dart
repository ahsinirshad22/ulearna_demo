import '../utils/export.dart';

enum AppColor {
  primary,
  bodyBackground,
  lightBlue,
  darkBlue,
  headingColor,
  bodyColor1,
  bodyColor2,
  strokeColor,
  gradientColor1,
  gradientColor2,
  whiteBlack,
  blackWhite,
}

extension GetColor on BuildContext {
  Color gc(AppColor key) {
    Color? toReturn;
    try {
      toReturn = Theme.of(this).brightness == Brightness.light
          ? CustomAppTheme.lightColors[key]
          : CustomAppTheme.darkColors[key];
    } catch (e) {
      toReturn = null;
    }
    return toReturn ?? Colors.orange;
  }
}
