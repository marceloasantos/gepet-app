import 'package:flutter/material.dart';
import 'package:gepet_app/app/controller/management_controller.dart';
import 'package:gepet_app/app/theme/app_colors.dart';
import 'package:gepet_app/app/utils/constants.dart';
import 'package:gepet_app/app/widgets/button_menu.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class MenuAdmin extends GetView<ManagementController> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          padding: EdgeInsets.symmetric(vertical: 10),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(5), color: Colors.grey[200]),
          child: Obx(
            () => Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(width: 10),
                controller.authorization.value == Constants.ADMIN
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
                  controller.authorization.value == Constants.ADMIN
                      ? "Administrador"
                      : "Usuario",
                  style: GoogleFonts.montserrat(color: AppColors.grayDark),
                ),
              ],
            ),
          ),
        ),
        SizedBox(height: 30),
        Obx(
          () => ButtonMenu(
              index: 0,
              text: "Usuarios",
              icon: "👥",
              backgroundColor: controller.selectedMenu.value == 0
                  ? AppColors.brownDark
                  : AppColors.grayMedium,
              textColor: controller.selectedMenu.value == 0
                  ? Colors.white
                  : AppColors.grayDark,
              onPressed: () => controller.selectMenuItem(0)),
        ),
        SizedBox(height: 10),
        Obx(
          () => ButtonMenu(
            index: 1,
            text: "Vacinas",
            icon: "💉",
            backgroundColor: controller.selectedMenu.value == 1
                ? AppColors.brownDark
                : AppColors.grayMedium,
            textColor: controller.selectedMenu.value == 1
                ? Colors.white
                : AppColors.grayDark,
            onPressed: () => controller.selectMenuItem(1),
          ),
        ),
        SizedBox(height: 10),
        Obx(
          () => ButtonMenu(
            index: 2,
            text: "Sair",
            icon: "🏃",
            backgroundColor: controller.selectedMenu.value == 2
                ? AppColors.brownDark
                : AppColors.grayMedium,
            textColor: controller.selectedMenu.value == 2
                ? Colors.white
                : AppColors.grayDark,
            onPressed: () => controller.logoff(),
          ),
        ),
      ],
    );
  }
}
