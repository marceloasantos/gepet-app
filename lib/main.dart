import 'package:flutter/material.dart';
import 'package:gepet_app/app/bindings/login_binding.dart';
import 'package:gepet_app/app/routes/app_pages.dart';
import 'package:gepet_app/app/theme/app_theme.dart';
import 'package:get/get.dart';
import 'package:oktoast/oktoast.dart';

import 'app/page/login_page.dart';

void main() async {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return OKToast(
      child: GetMaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'GePet',
        theme: appTheme,
        home: LoginPage(),
        getPages: AppPages.pages,
        initialRoute: Routes.LOGIN,
        initialBinding: LoginBinding(),
        defaultTransition: Transition.fade,
      ),
    );
  }
}
