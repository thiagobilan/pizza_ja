import 'package:get/get.dart';
import 'package:pizza_ja/app/models/user_model.dart';

import 'package:pizza_ja/app/repository/order_repository.dart';
import 'package:shared_preferences/shared_preferences.dart';

class OrdersController extends GetxController with StateMixin {
  late UserModel _user;

  final OrderRepository _repository;
  OrdersController(
    this._repository,
  );
  @override
  Future<void> onInit() async {
    super.onInit();
    final sp = await SharedPreferences.getInstance();
    _user = UserModel.fromJson(sp.getString('user')!);
    findOrder();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {}

  Future<void> findOrder() async {
    change([], status: RxStatus.loading());
    try {
      final orders = await _repository.findMyOrders(_user.id);
      change(orders, status: RxStatus.success());
    } catch (e) {
      print(e);
      change(['Erro ao Buscar Pedidos'], status: RxStatus.error());
    }
  }
}
