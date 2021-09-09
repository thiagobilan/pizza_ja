import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:pizza_ja/app/components/pizza_ja_bottom_navigation.dart';
import 'package:pizza_ja/app/modules/orders/widgets/history_panel.dart';

import '../controllers/orders_controller.dart';

class OrdersView extends GetView<OrdersController> {
  static const int NAVIGATION_BAR_INDEX = 1;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('OrdersPageView'),
        centerTitle: true,
      ),
      bottomNavigationBar: PizzaJaBottomNavigation(NAVIGATION_BAR_INDEX),
      body: LayoutBuilder(
        builder: (context, constructor) {
          return RefreshIndicator(
            onRefresh: () async => controller.findOrder(),
            child: ListView(
              children: [
                SizedBox(
                  height: constructor.maxHeight,
                  child: controller.obx(
                    (state) => _makeOrder(state),
                    onError: (_) => Center(
                      child: Text('Erro ao buscar pedido'),
                    ),
                  ),
                )
              ],
            ),
          );
        },
      ),
    );
  }

  Visibility _makeOrder(state) {
    print('Status é');
    print(state.toString());
    return Visibility(
      visible: state.length > 0,
      replacement: Container(
        padding: const EdgeInsets.all(8),
        child: Text(
          'Nenhum Pedido',
          style: TextStyle(
            fontSize: 20,
          ),
          textAlign: TextAlign.center,
        ),
      ),
      child: ListView.builder(
        physics: NeverScrollableScrollPhysics(),
        shrinkWrap: true,
        itemCount: state.length,
        itemBuilder: (context, index) {
          return HistoryPanel(state[index]);
        },
      ),
    );
  }
}
