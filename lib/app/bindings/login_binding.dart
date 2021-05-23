import 'package:gepet_app/app/controller/login_controller.dart';
import 'package:gepet_app/app/repository/base_repository.dart';
import 'package:gepet_app/app/repository/login_repository.dart';
import 'package:get/get.dart';

class LoginBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<LoginController>(() {
      return LoginController(LoginRepository(BaseRepository()));
    });
  }
}
