import 'package:flutter/material.dart';
import 'package:gepet_app/app/controller/management_controller.dart';
import 'package:gepet_app/app/controller/user_controller.dart';
import 'package:gepet_app/app/theme/app_colors.dart';
import 'package:gepet_app/app/widgets/input_text.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class UsersList extends GetView<ManagementController> {
  final UserController userController = Get.find();

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          margin: EdgeInsets.symmetric(horizontal: 5),
          width: Get.width,
          child: InputText(
            hintText: "Pesquisar",
            isPassword: false,
            controller: controller.userSearchTEC,
            onChanged: (filter) => controller.filterUsers(filter),
          ),
        ),
        SizedBox(height: 10),
        Expanded(
          child: Obx(
            () => GridView.builder(
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 3,
                childAspectRatio: 4,
              ),
              itemCount: controller.filteredUserList.value.length,
              itemBuilder: (context, index) {
                return Container(
                  decoration: BoxDecoration(
                    color: Colors.grey[200],
                    borderRadius: BorderRadius.circular(5),
                  ),
                  margin: EdgeInsets.only(bottom: 10, left: 5, right: 5),
                  padding: EdgeInsets.symmetric(vertical: 15, horizontal: 15),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "👤 ${controller.filteredUserList.value[index].nome!}",
                            style: GoogleFonts.montserrat(),
                          ),
                          SizedBox(height: 10),
                          Text(
                            "📧 ${controller.filteredUserList.value[index].email!}",
                            style: GoogleFonts.montserrat(),
                          ),
                        ],
                      ),
                      IconButton(
                        onPressed: () => userController.openUserInfo(
                            controller.filteredUserList.value[index]),
                        icon: Icon(
                          Icons.settings,
                          color: AppColors.grayDark,
                          size: Get.height * 0.025,
                        ),
                      )
                    ],
                  ),
                );
              },
            ),
          ),
        ),
      ],
    );
  }
}
