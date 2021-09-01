import 'package:get/get.dart';
import 'package:pizza_ja/app/models/user_logged.dart';
import 'package:pizza_ja/app/routes/app_pages.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SplashController extends GetxController {
  final _logged = UserLogged.empty.obs;

  UserLogged get logged => _logged.value;

  Future<void> checkLogin() async {
    final sp = await SharedPreferences.getInstance();
    // sp.clear();
    if (sp.containsKey('user')) {
      _logged(UserLogged.authenticade);
    } else {
      _logged(UserLogged.unauthenticade);
    }
  }

  @override
  void onInit() {
    super.onInit();

    ever<UserLogged>(_logged, _checkIsLogged);

    checkLogin();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {}

  Future<void> _checkIsLogged(UserLogged callback) async {
    switch (callback) {
      case UserLogged.authenticade:
        Get.offAllNamed(Routes.HOME);
        break;
      case UserLogged.unauthenticade:
        Get.offAllNamed(Routes.LOGIN);
        break;
      case UserLogged.empty:
        break;
      default:
    }
  }
}
