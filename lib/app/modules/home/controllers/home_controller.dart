import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';
import 'package:pizza_ja/app/modules/menu/controllers/menu_controller.dart';
import 'package:pizza_ja/app/modules/menu/views/menu_view.dart';
import 'package:pizza_ja/app/repository/menu_repository.dart';

class HomeController extends GetxController {
  Future<void> openMenu(String pizzaSize) async {
    Get.put(MenuRepository(restClient: Get.find()));
    Get.put(MenuController(Get.find()));
    print('Abrindo Tela');
    await showBarModalBottomSheet(
      // enableDrag: false,
      isDismissible: false,
      context: Get.context!,
      builder: (context) {
        return MenuView(
          pizzaSize: pizzaSize,
        );
      },
    );
    Get.delete<MenuController>();
    Get.delete<MenuRepository>();
    print('Fechando Tela');
  }

  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {}
}
