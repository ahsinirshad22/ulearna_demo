import '../utils/export.dart';
import 'app_input_decoration_theme.dart';
import 'app_text_theme.dart';

class CustomAppTheme {
  CustomAppTheme._();

  static const Color primaryColor = Color(0xff8271EE);
  static const Color white = Colors.white;
  static const Color black = Colors.black;
  static const Color red = Colors.red;
  static const transparent = Colors.transparent;

  static Map<AppColor, Color> lightColors = {
    AppColor.primary: primaryColor,
    AppColor.bodyBackground: const Color(0xffF8F8F8),
    AppColor.lightBlue: const Color(0xff3DAAE0),
    AppColor.darkBlue: const Color(0xff6383FA),
    AppColor.headingColor: const Color(0xff1B2559),
    AppColor.bodyColor1: const Color(0xff505986),
    AppColor.bodyColor2: const Color(0xffA3AED0),
    AppColor.strokeColor: const Color(0xffE0DEF1),
    AppColor.gradientColor1: const Color(0xffAFC0FF),
    AppColor.gradientColor2: const Color(0xff6383FA),
    AppColor.whiteBlack: white,
    AppColor.blackWhite: black,
  };

  static Map<AppColor, Color> darkColors = {
    AppColor.primary: primaryColor,
    AppColor.bodyBackground: const Color(0xffF8F8F8),
    AppColor.lightBlue: const Color(0xff3DAAE0),
    AppColor.darkBlue: const Color(0xff6383FA),
    AppColor.headingColor: const Color(0xff1B2559),
    AppColor.bodyColor1: const Color(0xff505986),
    AppColor.bodyColor2: const Color(0xffA3AED0),
    AppColor.strokeColor: const Color(0xffE0DEF1),
    AppColor.gradientColor1: const Color(0xffAFC0FF),
    AppColor.gradientColor2: const Color(0xff6383FA),
    AppColor.whiteBlack: black,
    AppColor.blackWhite: white,
  };

  static ThemeData lightTheme = ThemeData(
    useMaterial3: true,
    colorScheme: ColorScheme.fromSeed(
      seedColor: lightColors[AppColor.primary] ?? primaryColor,
      brightness: Brightness.light,
    ),
    fontFamily: "Effra",
    scaffoldBackgroundColor: lightColors[AppColor.bodyBackground] ?? white,
    inputDecorationTheme: AppInputDecorationTheme.lightInputDecorationTheme(),
    indicatorColor: primaryColor,
    textTheme: AppTextTheme.lightTextTheme,
  );

  static ThemeData darkTheme = ThemeData(
    useMaterial3: true,
    colorScheme: ColorScheme.fromSeed(
      seedColor: darkColors[AppColor.primary] ?? primaryColor,
      brightness: Brightness.dark,
    ),
    fontFamily: "Effra",
    scaffoldBackgroundColor: darkColors[AppColor.bodyBackground] ?? black,
    inputDecorationTheme: AppInputDecorationTheme.darkInputDecorationTheme(),
    indicatorColor: primaryColor,
    textTheme: AppTextTheme.darkTextTheme,
  );
}
