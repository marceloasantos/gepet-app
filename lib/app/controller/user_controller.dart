import 'package:flutter/material.dart';
import 'package:gepet_app/app/model/usuario_model.dart';
import 'package:gepet_app/app/repository/management_repository.dart';
import 'package:gepet_app/app/routes/app_pages.dart';
import 'package:gepet_app/app/theme/app_colors.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:oktoast/oktoast.dart';

class UserController extends GetxController {
  final ManagementRepository _repository;

  final usernameTEC = TextEditingController();
  final emailTEC = TextEditingController();
  final passwordTEC = TextEditingController();
  final authorizationTEC = TextEditingController();

  var selectedUser = "".obs;

  UserController(this._repository);

  createUser() {
    var user = UsuarioModel(
      nome: usernameTEC.text,
      email: emailTEC.text,
      senha: passwordTEC.text,
      autorizacao: authorizationTEC.text,
    );

    _repository.addUser(user);

    Get.back();
  }

  openUserInfo(UsuarioModel model) {
    usernameTEC.text = model.nome!;
    emailTEC.text = model.email!;
    passwordTEC.text = "0123456789";
    authorizationTEC.text = model.autorizacoes![0].nome!;
    selectedUser.value = model.id!;

    Get.toNamed(Routes.USER_INFO);
  }

  removeUser() {
    var result = _repository.removeUser(selectedUser.value);

    result.then((value) {
      if (value.statusCode == 200) {
        showSuccessToast("Usuario removido com sucesso.");
        Get.back();
      } else {
        showErrorToast("Nao foi possivel remover o usuario. Tente novamente.");
      }
    });
  }

  editUser() {
    var result = _repository.editUser(
      UsuarioModel(
        nome: usernameTEC.text,
        email: emailTEC.text,
        senha: passwordTEC.text,
        autorizacao: authorizationTEC.text,
      ),
    );

    result.then((value) {
      if (value.statusCode == 200) {
        showSuccessToast("Usuario editado com sucesso.");
        Get.back();
      } else {
        showErrorToast("Nao foi possivel editar o usuario. Tente novamente.");
      }
    });
  }

  showErrorToast(message) {
    showToastWidget(
      Container(
        padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
        decoration: BoxDecoration(
            color: AppColors.brownLight,
            borderRadius: BorderRadius.circular(5)),
        child: Text(
          message,
          style: GoogleFonts.montserrat(color: AppColors.brownDark),
        ),
      ),
      position: ToastPosition.bottom,
      duration: Duration(seconds: 3),
    );
  }

  void showSuccessToast(message) {
    showToastWidget(
      Container(
        padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
        decoration: BoxDecoration(
            color: Colors.green[300], borderRadius: BorderRadius.circular(5)),
        child: Text(
          message,
          style: GoogleFonts.montserrat(color: Colors.grey[900]),
        ),
      ),
      position: ToastPosition.bottom,
      duration: Duration(seconds: 3),
    );
  }
}
