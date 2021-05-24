import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:gepet_app/app/controller/management_controller.dart';
import 'package:gepet_app/app/page/management/widgets/users_list.dart';
import 'package:gepet_app/app/theme/app_colors.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class ManagementPage extends GetView<ManagementController> {
  @override
  Widget build(BuildContext context) {
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
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                  width: Get.width * 0.2,
                  padding: EdgeInsets.symmetric(horizontal: 10, vertical: 20),
                  child: FutureBuilder(
                    future: controller.renderMenu(),
                    initialData: SpinKitFadingCube(
                      color: AppColors.brownLight,
                      size: 50,
                    ),
                    builder: (context, AsyncSnapshot<Widget> snapshot) {
                      return snapshot.data!;
                    },
                  )),
              Expanded(
                child: Container(
                  padding: EdgeInsets.symmetric(horizontal: 25, vertical: 20),
                  height: Get.height * 0.8,
                  child: GetX<ManagementController>(
                    builder: (context) {
                      switch (context.selectedMenu.value) {
                        case 0:
                          return UsersList();
                        default:
                          return Center(
                            child: Text(
                              "🐶 Bem vindo(a) ao GePet! 🐱",
                              style: GoogleFonts.montserrat(fontSize: 24),
                            ),
                          );
                      }
                    },
                  ),
                ),
              )
            ],
          ),
        ],
      ),
    );
  }
}
