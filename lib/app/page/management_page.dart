import 'package:flutter/material.dart';
import 'package:gepet_app/app/controller/management_controller.dart';
import 'package:gepet_app/app/theme/app_colors.dart';
import 'package:gepet_app/app/widgets/button_menu.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class ManagementPage extends GetView<ManagementController> {
  @override
  Widget build(BuildContext context) {
    controller.getAuthorization();

    return Scaffold(
      body: Column(
        children: [
          Container(
            width: Get.width,
            color: Colors.grey[200],
            padding: EdgeInsets.symmetric(
                horizontal: Get.width * 0.01, vertical: 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "GEPET",
                  style: GoogleFonts.michroma(
                    fontSize: Get.height * 0.03,
                    color: AppColors.brownLight,
                  ),
                ),
              ],
            ),
          ),
          Row(
            children: [
              Container(
                width: Get.width * 0.2,
                padding: EdgeInsets.symmetric(horizontal: 10, vertical: 20),
                child: Column(
                  children: [
                    Container(
                      padding: EdgeInsets.symmetric(vertical: 10),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(5),
                          color: Colors.grey[200]),
                      child: Obx(
                        () => Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            SizedBox(width: 10),
                            controller.authorization.value == "ROLE_ADMIN"
                                ? Icon(
                                    Icons.add_moderator,
                                    color: Colors.green,
                                  )
                                : Icon(
                                    Icons.lock_outline,
                                    color: Colors.red,
                                  ),
                            SizedBox(width: 10),
                            Text(
                              controller.authorization.value == "ROLE_ADMIN"
                                  ? "Administrador"
                                  : "Usuario",
                              style: GoogleFonts.montserrat(
                                  color: AppColors.grayDark),
                            ),
                          ],
                        ),
                      ),
                    ),
                    SizedBox(height: 30),
                    ButtonMenu(
                      index: 0,
                      text: "Usuarios",
                      icon: Icons.account_box,
                      backgroundColor: AppColors.grayMedium,
                      textColor: AppColors.grayDark,
                      onPressed: () {},
                    ),
                    SizedBox(height: 10),
                    ButtonMenu(
                      index: 1,
                      text: "Vacinas",
                      icon: Icons.medication,
                      backgroundColor: AppColors.brownDark,
                      textColor: Colors.white,
                      onPressed: () {},
                    ),
                    SizedBox(height: 10),
                    ButtonMenu(
                      index: 2,
                      text: "Sair",
                      icon: Icons.exit_to_app,
                      backgroundColor: AppColors.grayMedium,
                      textColor: AppColors.grayDark,
                      onPressed: () => controller.logoff(),
                    ),
                  ],
                ),
              ),
              Expanded(
                child: Column(
                  children: [],
                ),
              )
            ],
          ),
        ],
      ),
    );
  }
}
