import 'package:flutter/material.dart';
import 'package:gepet_app/app/model/usuario_model.dart';
import 'package:gepet_app/app/repository/login_repository.dart';
import 'package:gepet_app/app/routes/app_pages.dart';
import 'package:gepet_app/app/theme/app_colors.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:oktoast/oktoast.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LoginController extends GetxController {
  final emailTEC = TextEditingController();
  final passTEC = TextEditingController();
  final LoginRepository _repository;

  var loading = false.obs;

  LoginController(this._repository);

  void login() async {
    loading(true);
    var prefs = await SharedPreferences.getInstance();
    var result = _repository.login(emailTEC.text, passTEC.text);

    result.then((value) {
      if (value.statusCode == 403) {
        showErrorToast();
      } else {
        var usuario = UsuarioModel.fromJson(value?.data);
        prefs.setString("token", usuario.token!);
        prefs.setString("nome", usuario.email!);
        prefs.setString("autorizacao", usuario.autorizacao!);

        Get.toNamed(Routes.MANAGEMENT);
      }

      Future.delayed(Duration(milliseconds: 1000), () => loading(false));
    });
  }

  showErrorToast() {
    showToastWidget(
      Container(
        padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
        decoration: BoxDecoration(
            color: AppColors.brownLight,
            borderRadius: BorderRadius.circular(5)),
        child: Text(
          "Usuario ou senha incorretos. Tente novamente.",
          style: GoogleFonts.montserrat(color: AppColors.brownDark),
        ),
      ),
      position: ToastPosition.bottom,
      duration: Duration(seconds: 3),
    );
  }
}
