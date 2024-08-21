import 'dart:developer';

import 'export.dart';

getShrinkSizedBox() {
  return const SizedBox.shrink();
}

addHeight([dynamic value = 10]) {
  return SizedBox(
    height: value.toDouble(),
  );
}

addWidth([dynamic value = 10]) {
  return SizedBox(
    width: value.toDouble(),
  );
}

showToast(String message) {
  Fluttertoast.showToast(
      msg: message,
      toastLength: Toast.LENGTH_SHORT,
      gravity: ToastGravity.BOTTOM,
      timeInSecForIosWeb: 1,
      backgroundColor: Colors.red,
      textColor: Colors.white,
      fontSize: 16);
}

Widget loadingWidget({Color? loaderColor, double? size}) => Center(
      child: SpinKitFadingCube(
        color: loaderColor ?? CustomAppTheme.primaryColor,
        size: size ?? 30.0,
      ),
    );

showAlert(
    {required DialogType dialogType,
    required String title,
    String? description,
    String? btnCancelText,
    String? btnOkText,
    Color? btnOkColor,
    bool reverseBtnOrder = false,
    Color? btnCancelColor,
    VoidCallback? onCancelPress,
    VoidCallback? onOkPress,
    Function(DismissType dismissType)? onDismissCallBack,
    bool autoDismiss = true,
    bool dismissOnTouchOutside = true,
    bool dismissOnBackKeyPress = true}) {
  AwesomeDialog(
    context: Get.context as BuildContext,
    dismissOnTouchOutside: dismissOnTouchOutside,
    dialogType: dialogType,
    width: 400,
    reverseBtnOrder: reverseBtnOrder,
    animType: AnimType.bottomSlide,
    title: title,
    btnOkColor: btnOkColor,
    btnCancelColor: btnCancelColor,
    onDismissCallback: onDismissCallBack,
    autoDismiss: autoDismiss,
    desc: description ?? "",
    btnCancelText: btnCancelText ?? "dismiss".tr,
    btnOkText: btnOkText,
    btnCancelOnPress: onCancelPress ?? () {},
    btnOkOnPress: onOkPress,
    dismissOnBackKeyPress: dismissOnBackKeyPress,
  ).show();
}

enum UrlType { simple, phone, email, sms }

void launchURL(String url, [UrlType type = UrlType.simple]) async {
  if (url.isEmpty) {
    return;
  }

  if (type == UrlType.phone) {
    url = "tel:$url";
  } else if (type == UrlType.email) {
    url = "mailto:$url";
  } else if (type == UrlType.sms) {
    url = "sms:$url";
  }

  if (!await launchUrl(Uri.parse(url), mode: LaunchMode.externalApplication)) {
    showToast("${"failedToLaunch".tr} $url");
  }
}

void customLog(String message) {
  if (kDebugMode) {
    log(message);
  }
}
