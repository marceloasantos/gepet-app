import 'package:flutter/material.dart';
import 'package:gepet_app/app/model/usuario_model.dart';
import 'package:gepet_app/app/page/management/widgets/menu_admin.dart';
import 'package:gepet_app/app/page/management/widgets/menu_user.dart';
import 'package:gepet_app/app/repository/management_repository.dart';
import 'package:gepet_app/app/theme/app_colors.dart';
import 'package:gepet_app/app/utils/constants.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:oktoast/oktoast.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ManagementController extends GetxController {
  final ManagementRepository _repository;
  var authorization = "".obs;
  var selectedMenu = 5.obs;
  var userList = [].obs;

  ManagementController(this._repository);

  getAuthorization() async {
    var prefs = await SharedPreferences.getInstance();

    authorization.value = prefs.getString("autorizacao")!;
  }

  selectMenuItem(int itemIndex) {
    selectedMenu.value = itemIndex;

    if (authorization.value == Constants.ADMIN) {
      switch (itemIndex) {
        case 0:
          listUsers();
          break;
        default:
      }
    }
  }

  listUsers() {
    var result = _repository.listUsers();

    result.then(
      (value) {
        var usuarios =
            value?.data.map((x) => UsuarioModel.fromJson(x)).toList();
        userList.value = usuarios;
      },
    );
  }

  logoff() {
    Get.back();
    showToastWidget(
      Container(
        padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
        decoration: BoxDecoration(
            color: AppColors.brownLight,
            borderRadius: BorderRadius.circular(5)),
        child: Text(
          "Você saiu da aplicação.",
          style: GoogleFonts.montserrat(color: AppColors.brownDark),
        ),
      ),
      position: ToastPosition.bottom,
      duration: Duration(seconds: 3),
    );
  }

  Future<Widget> renderMenu() async {
    await getAuthorization();
    return authorization.value == "ROLE_ADMIN" ? MenuAdmin() : MenuUser();
  }
}
