import 'package:flutter/material.dart';
import 'package:gepet_app/app/controller/login_controller.dart';
import 'package:gepet_app/app/theme/app_colors.dart';
import 'package:gepet_app/app/widgets/button_text.dart';
import 'package:gepet_app/app/widgets/input_text.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class LoginPage extends GetView<LoginController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: Get.width,
        height: Get.height,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(
              width: Get.width * 0.2,
              child: Image(
                image: AssetImage("images/logo.png"),
              ),
            ),
            Text(
              "GEPET",
              style: GoogleFonts.michroma(
                fontSize: Get.height * 0.05,
                color: AppColors.brownLight,
              ),
            ),
            SizedBox(height: Get.height * 0.05),
            Container(
                width: Get.width * 0.2,
                child: InputText(
                  hintText: "Usuário",
                  isPassword: false,
                  controller: controller.emailTEC,
                )),
            SizedBox(height: Get.height * 0.025),
            Container(
              width: Get.width * 0.2,
              child: InputText(
                hintText: "Senha",
                isPassword: true,
                controller: controller.passTEC,
              ),
            ),
            SizedBox(height: Get.height * 0.05),
            Container(
              width: Get.width * 0.2,
              child: ButtonText(
                text: "Acessar",
                backgroundColor: AppColors.brownDark,
                textColor: Colors.white,
                onPressed: () => controller.login(),
              ),
            )
          ],
        ),
      ),
    );
  }
}
