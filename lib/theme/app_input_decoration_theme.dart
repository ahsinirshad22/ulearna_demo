import '../utils/export.dart';

class AppInputDecorationTheme {
  AppInputDecorationTheme._();

  static InputDecorationTheme lightInputDecorationTheme() {
    InputBorder activeBorder = OutlineInputBorder(
        borderSide: BorderSide(
          color: CustomAppTheme.lightColors[AppColor.primary] ??
              CustomAppTheme.primaryColor,
        ),
        borderRadius: BorderRadius.circular(5),
        gapPadding: 2);

    InputBorder inActiveBorder = OutlineInputBorder(
        borderSide: BorderSide(
            color: CustomAppTheme.lightColors[AppColor.strokeColor] ??
                CustomAppTheme.primaryColor),
        borderRadius: BorderRadius.circular(5),
        gapPadding: 2);

    InputBorder errorBorder = OutlineInputBorder(
        borderSide: const BorderSide(color: CustomAppTheme.red),
        borderRadius: BorderRadius.circular(5),
        gapPadding: 2);

    return InputDecorationTheme(
      border: activeBorder,
      enabledBorder: activeBorder,
      focusedBorder: activeBorder,
      disabledBorder: inActiveBorder,
      errorBorder: errorBorder,
      focusedErrorBorder: errorBorder,
      isCollapsed: true,
      contentPadding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
    );
  }

  static InputDecorationTheme darkInputDecorationTheme() {
    InputBorder activeBorder = OutlineInputBorder(
        borderSide: BorderSide(
            color: CustomAppTheme.lightColors[AppColor.primary] ??
                CustomAppTheme.primaryColor),
        borderRadius: BorderRadius.circular(5),
        gapPadding: 2);

    InputBorder inActiveBorder = OutlineInputBorder(
        borderSide: BorderSide(
            color: CustomAppTheme.lightColors[AppColor.strokeColor] ??
                CustomAppTheme.primaryColor),
        borderRadius: BorderRadius.circular(5),
        gapPadding: 2);

    InputBorder errorBorder = OutlineInputBorder(
        borderSide: const BorderSide(color: CustomAppTheme.red),
        borderRadius: BorderRadius.circular(5),
        gapPadding: 2);

    return InputDecorationTheme(
      border: activeBorder,
      enabledBorder: activeBorder,
      focusedBorder: activeBorder,
      disabledBorder: inActiveBorder,
      errorBorder: errorBorder,
      focusedErrorBorder: errorBorder,
      isCollapsed: true,
      contentPadding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
    );
  }
}
