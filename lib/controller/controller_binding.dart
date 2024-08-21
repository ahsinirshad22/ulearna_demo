import 'package:flutter_template/controller/bytes_controller.dart';
import 'package:get/get.dart';
import 'common_controller.dart';

class ControllersBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(CommonController(), permanent: true);
    Get.put(BytesController(), permanent: true);
  }
}
