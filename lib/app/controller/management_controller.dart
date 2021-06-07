import 'package:flutter/material.dart';
import 'package:gepet_app/app/model/animal_model.dart';
import 'package:gepet_app/app/model/usuario_model.dart';
import 'package:gepet_app/app/model/vacina_model.dart';
import 'package:gepet_app/app/page/management/widgets/menu_admin.dart';
import 'package:gepet_app/app/page/management/widgets/menu_user.dart';
import 'package:gepet_app/app/repository/management_repository.dart';
import 'package:gepet_app/app/theme/app_colors.dart';
import 'package:gepet_app/app/utils/constants.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:oktoast/oktoast.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ManagementController extends GetxController {
  final ManagementRepository _repository;
  final userSearchTEC = TextEditingController();

  var usuario = Rxn<UsuarioModel>();
  var authorization = "".obs;
  var selectedMenu = 5.obs;
  var userList = [].obs;
  var filteredUserList = [].obs;
  var vaxList = [].obs;
  var petList = [].obs;
  var loading = false.obs;

  ManagementController(this._repository);

  @override
  onInit() async {
    getUser();
    super.onInit();
  }

  getUser() async {
    var prefs = await SharedPreferences.getInstance();

    var result = _repository.listUserByName(prefs.getString("nome")!);

    result.then((value) {
      var user = UsuarioModel.fromJson(value?.data);
      usuario.value = user;
    });
  }

  getAuthorization() async {
    var prefs = await SharedPreferences.getInstance();

    authorization.value = prefs.getString("autorizacao")!;
  }

  listUsers() {
    loading(true);
    var result = _repository.listUsers();

    result.then(
      (value) {
        var usuarios =
            value?.data.map((x) => UsuarioModel.fromJson(x)).toList();
        userList.value = usuarios;
        filteredUserList.value = usuarios;
      },
    );
    loading(false);
  }

  listVax() {
    var result = _repository.listVax();

    result.then(
      (value) {
        var vacinas = value?.data.map((x) => VacinaModel.fromJson(x)).toList();
        vaxList.value = vacinas;
      },
    );
  }

  listPets() {
    var result = _repository.listPets(usuario.value!.id!);

    result.then((value) {
      var animais = value?.data.map((x) => AnimalModel.fromJson(x)).toList();
      petList.value = animais;
    });
  }

  logoff() {
    Get.back();
    showToastWidget(
      Container(
        padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
        decoration: BoxDecoration(
            color: AppColors.brownLight,
            borderRadius: BorderRadius.circular(5)),
        child: Text(
          "Você saiu da aplicação.",
          style: GoogleFonts.montserrat(color: AppColors.brownDark),
        ),
      ),
      position: ToastPosition.bottom,
      duration: Duration(seconds: 3),
    );
  }

  selectMenuItem(int itemIndex) {
    selectedMenu.value = itemIndex;

    if (authorization.value == Constants.ADMIN) {
      switch (itemIndex) {
        case 0:
          listUsers();
          break;
        case 1:
          listVax();
          break;
        default:
      }
    } else if (authorization.value == Constants.USER) {
      switch (itemIndex) {
        case 0:
          listPets();
          break;
        case 1:
          break;
        default:
      }
    }
  }

  Future<Widget> renderMenu() async {
    await getAuthorization();
    return authorization.value == "ROLE_ADMIN" ? MenuAdmin() : MenuUser();
  }

  filterUsers(String filter) {
    if (filter == "") {
      filteredUserList.value = userList.value;
    } else {
      filteredUserList.value = userList.value
          .where((element) => element.nome!.contains(filter))
          .toList();
    }
  }
}
