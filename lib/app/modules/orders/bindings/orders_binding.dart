import 'package:get/get.dart';
import 'package:pizza_ja/app/repository/order_repository.dart';

import '../controllers/orders_controller.dart';

class OrdersPageBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(OrderRepository(Get.find()));
    Get.put(
      OrdersController(Get.find()),
    );
  }
}
