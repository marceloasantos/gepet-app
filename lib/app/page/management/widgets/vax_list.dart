import 'package:flutter/material.dart';
import 'package:gepet_app/app/controller/management_controller.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class VaxList extends GetView<ManagementController> {
  @override
  Widget build(BuildContext context) {
    return Obx(
      () => GridView.builder(
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 3,
          childAspectRatio: 2.5,
        ),
        itemCount: controller.vaxList.length,
        itemBuilder: (context, index) {
          return Container(
            decoration: BoxDecoration(
              color: Colors.grey[200],
              borderRadius: BorderRadius.circular(5),
            ),
            margin: EdgeInsets.only(bottom: 10, left: 5, right: 5),
            padding: EdgeInsets.symmetric(vertical: 15, horizontal: 15),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "💉 ${controller.vaxList.value[index].nome!}",
                  style: GoogleFonts.montserrat(),
                ),
                SizedBox(height: 25),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    InkWell(
                      onTap: () => {},
                      child: Container(
                        padding:
                            EdgeInsets.symmetric(vertical: 10, horizontal: 10),
                        width: Get.width * 0.06,
                        decoration: BoxDecoration(
                          color: Colors.grey[100],
                          borderRadius: BorderRadius.circular(5),
                        ),
                        child: Column(
                          children: [
                            Text("🔎"),
                            SizedBox(height: 5),
                            Text(
                              "Detalhes",
                              style: GoogleFonts.montserrat(fontSize: 12),
                            ),
                          ],
                        ),
                      ),
                    ),
                    InkWell(
                      onTap: () => {},
                      child: Container(
                        padding:
                            EdgeInsets.symmetric(vertical: 10, horizontal: 10),
                        width: Get.width * 0.06,
                        decoration: BoxDecoration(
                          color: Colors.grey[100],
                          borderRadius: BorderRadius.circular(5),
                        ),
                        child: Column(
                          children: [
                            Text("🔧"),
                            SizedBox(height: 5),
                            Text(
                              "Editar",
                              style: GoogleFonts.montserrat(fontSize: 12),
                            ),
                          ],
                        ),
                      ),
                    ),
                    InkWell(
                      onTap: () => {},
                      child: Container(
                        padding:
                            EdgeInsets.symmetric(vertical: 10, horizontal: 10),
                        width: Get.width * 0.06,
                        decoration: BoxDecoration(
                          color: Colors.grey[100],
                          borderRadius: BorderRadius.circular(5),
                        ),
                        child: Column(
                          children: [
                            Text("🗑"),
                            SizedBox(height: 5),
                            Text(
                              "Excluir",
                              style: GoogleFonts.montserrat(fontSize: 12),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                )
              ],
            ),
          );
        },
      ),
    );
  }
}
