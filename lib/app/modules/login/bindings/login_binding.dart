import 'package:get/get.dart';
import 'package:pizza_ja/app/repository/user_repository.dart';

import '../controllers/login_controller.dart';

class LoginBinding extends Bindings {
  @override
  void dependencies() {
    // Get.put(UserRepository(restClient: Get.find()));
    Get.lazyPut(() => UserRepository(restClient: Get.find()));
    Get.lazyPut<LoginController>(
      () => LoginController(Get.find()),
    );
  }
}
