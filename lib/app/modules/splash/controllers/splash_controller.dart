import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SplashController extends GetxController {
  Future<void> checkLogin() async {
    final sp = await SharedPreferences.getInstance();
    if (sp.containsKey('user')) {
      
    } else {}
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
