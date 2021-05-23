import 'package:gepet_app/app/controller/management_controller.dart';
import 'package:get/get.dart';

class ManagementBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ManagementController>(() {
      return ManagementController();
    });
  }
}
