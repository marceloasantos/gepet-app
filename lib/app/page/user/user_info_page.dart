import 'package:flutter/material.dart';
import 'package:gepet_app/app/controller/user_controller.dart';
import 'package:gepet_app/app/theme/app_colors.dart';
import 'package:gepet_app/app/widgets/button_text.dart';
import 'package:gepet_app/app/widgets/input_text.dart';
import 'package:get/get.dart';

class UserInfoPage extends GetView<UserController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        alignment: Alignment.center,
        width: Get.width,
        decoration: BoxDecoration(
          color: Colors.transparent,
        ),
        child: Container(
          height: Get.height * 0.6,
          width: Get.width * 0.225,
          padding: EdgeInsets.symmetric(
            horizontal: Get.width * 0.025,
            vertical: Get.height * 0.05,
          ),
          decoration: BoxDecoration(
              color: Colors.white, borderRadius: BorderRadius.circular(10)),
          child: Column(
            children: [
              Container(
                child: InputText(
                  hintText: "Nome",
                  isPassword: false,
                  controller: controller.usernameTEC,
                ),
              ),
              SizedBox(height: 10),
              Container(
                child: InputText(
                  hintText: "E-mail",
                  isPassword: false,
                  controller: controller.emailTEC,
                ),
              ),
              SizedBox(height: 10),
              Container(
                child: InputText(
                  hintText: "Senha",
                  isPassword: true,
                  controller: controller.passwordTEC,
                ),
              ),
              SizedBox(height: 10),
              Container(
                child: InputText(
                  hintText: "Autorizacao",
                  isPassword: false,
                  controller: controller.authorizationTEC,
                ),
              ),
              Expanded(
                child: SizedBox(),
              ),
              Container(
                width: Get.width,
                child: ButtonText(
                  text: "Salvar",
                  backgroundColor: AppColors.brownDark,
                  textColor: Colors.white,
                  onPressed: () => controller.editUser(),
                ),
              ),
              SizedBox(height: 10),
              Container(
                width: Get.width,
                child: ButtonText(
                  text: "Excluir",
                  backgroundColor: Colors.white,
                  textColor: AppColors.brownLight,
                  onPressed: () => controller.removeUser(),
                ),
              ),
              SizedBox(height: 10),
              Container(
                width: Get.width,
                child: ButtonText(
                  text: "Cancelar",
                  backgroundColor: Colors.white,
                  textColor: AppColors.brownLight,
                  onPressed: () => Get.back(),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
