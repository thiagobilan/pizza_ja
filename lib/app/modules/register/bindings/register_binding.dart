import 'package:get/get.dart';
import 'package:pizza_ja/app/repository/user_repository.dart';

import '../controllers/register_controller.dart';

class RegisterBinding extends Bindings {
  @override
  void dependencies() {
    //LazyPut?
    Get.put(UserRepository(restClient: Get.find()));
    Get.lazyPut<RegisterController>(
      () => RegisterController(Get.find()),
    );
  }
}
