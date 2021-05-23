import 'package:flutter/material.dart';
import 'package:gepet_app/app/model/usuario_model.dart';
import 'package:gepet_app/app/repository/login_repository.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LoginController extends GetxController {
  final emailTEC = TextEditingController();
  final passTEC = TextEditingController();
  final LoginRepository _repository;

  LoginController(this._repository);

  void login() async {
    var prefs = await SharedPreferences.getInstance();
    var result = _repository.login(emailTEC.text, passTEC.text);

    result.then((value) {
      var usuario = UsuarioModel.fromJson(value?.data);
      prefs.setString("token", usuario.token!);
      prefs.setString("autorizacao", usuario.autorizacao!);
    });
  }
}
