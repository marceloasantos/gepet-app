import 'package:get/get.dart';
import 'package:oktoast/oktoast.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ManagementController extends GetxController {
  var authorization = "".obs;

  getAuthorization() async {
    var prefs = await SharedPreferences.getInstance();

    authorization.value = prefs.getString("autorizacao")!;
  }

  logoff() {
    Get.back();
    showToast("Voce saiu da aplicacao.");
  }
}
