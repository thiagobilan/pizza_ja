import 'package:get/get.dart';
import 'package:pizza_ja/app/helpers/rest_client.dart';

class ApplicationBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<RestClient>(() => RestClient(), fenix: true);
    // Get.put(RestClient(), permanent: true);
  }
}
