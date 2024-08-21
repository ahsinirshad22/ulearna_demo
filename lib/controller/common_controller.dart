import '../utils/export.dart';

class CommonController extends GetxController {
  var isDarkTheme = false.obs;
  var selectedLanguage = "en".obs;
  final localStorage = GetSecureStorage(password: AppConstant.dbSecurityKey);
  var selectedMenuItem = 0.obs;

  @override
  void onInit() {
    super.onInit();
    getThemeFromStorage();
  }

  Future<void> setFirstTimeOver() async {
    await localStorage.write(AppConstant.keyIsFirstTime, true);
  }

  Future<bool> isFirstTime() async {
    var res = await localStorage.read(AppConstant.keyIsFirstTime);
    if (res != null) {
      return !res;
    }
    return true;
  }

  Future<void> getThemeFromStorage() async {
    var res = await localStorage.read(AppConstant.keyIsDarkTheme);
    if (res != null) {
      isDarkTheme.value = res;
      Get.changeThemeMode(isDarkTheme.value ? ThemeMode.dark : ThemeMode.light);
      return;
    }
    isDarkTheme.value = false;
  }

  Future<void> setDarkTheme({required bool enableDarkTheme}) async {
    await localStorage.write(AppConstant.keyIsDarkTheme, enableDarkTheme);
    isDarkTheme.value = enableDarkTheme;
    Get.changeThemeMode(isDarkTheme.value ? ThemeMode.dark : ThemeMode.light);
  }

}
