import 'package:gepet_app/app/controller/user_controller.dart';
import 'package:gepet_app/app/repository/base_repository.dart';
import 'package:gepet_app/app/repository/management_repository.dart';
import 'package:get/get.dart';

class UserBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<UserController>(() {
      return UserController(ManagementRepository(BaseRepository()));
    });
  }
}
