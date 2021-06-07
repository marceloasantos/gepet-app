import 'package:gepet_app/app/bindings/login_binding.dart';
import 'package:gepet_app/app/bindings/management_binding.dart';
import 'package:gepet_app/app/bindings/user_binding.dart';
import 'package:gepet_app/app/page/login/login_page.dart';
import 'package:gepet_app/app/page/management/management_page.dart';
import 'package:gepet_app/app/page/user/user_creation_page.dart';
import 'package:gepet_app/app/page/user/user_info_page.dart';
import 'package:get/get.dart';
part './app_routes.dart';

class AppPages {
  static final pages = [
    GetPage(
      name: Routes.LOGIN,
      page: () => LoginPage(),
      binding: LoginBinding(),
    ),
    GetPage(
      name: Routes.MANAGEMENT,
      page: () => ManagementPage(),
      binding: ManagementBinding(),
    ),
    GetPage(
      name: Routes.CREATE_USER,
      page: () => UserCreationPage(),
      binding: UserBinding(),
    ),
    GetPage(
      name: Routes.USER_INFO,
      page: () => UserInfoPage(),
      binding: UserBinding(),
    )
  ];
}
