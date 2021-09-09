import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pizza_ja/app/helpers/loader_mixin.dart';
import 'package:pizza_ja/app/helpers/messages_mixin.dart';
import 'package:pizza_ja/app/models/menu_item_model.dart';
import 'package:pizza_ja/app/models/user_model.dart';
import 'package:pizza_ja/app/repository/order_repository.dart';
import 'package:pizza_ja/app/view_models/checkout_input_model.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:group_radio_button/group_radio_button.dart';

class ShoppingCardController extends GetxController
    with MessagesMixin, LoaderMixin {
  final OrderRepository _repository;
  final RxList<MenuItemModel> flavorSelected;
  final _loading = false.obs;
  final _message = MessageModel().obs;
  final _user = Rx<UserModel?>(null);
  final _address = ''.obs;
  final _paymentType = ''.obs;
  final addresEditingController = TextEditingController();
  var _singleValue = "Text alignment right";
  String get userName => _user.value?.name ?? '';
  double get totalValue => flavorSelected.fold(
      0, (previousValue, element) => previousValue += element.price);

  String get address => _address.value;
  String get paymentType => _paymentType.value;

  ShoppingCardController(this._repository, this.flavorSelected);

  Future<void> changeAddress() async {
    await Get.defaultDialog(
      title: 'Endereço de entrega',
      content: TextFormField(
        controller: addresEditingController,
      ),
      cancel: ElevatedButton(
        onPressed: () => Get.back(),
        style: ElevatedButton.styleFrom(onPrimary: Get.theme.primaryColor),
        child: Text('Cancelar'),
      ),
      confirm: ElevatedButton(
        onPressed: () {
          _address(addresEditingController.text);
          addresEditingController.clear();
          Get.back();
        },
        style: ElevatedButton.styleFrom(onPrimary: Get.theme.primaryColor),
        child: Text('Alterar'),
      ),
    );
  }

  Future<void> changePaymentType() async {
    var payment = '1'.obs;
    await Get.defaultDialog(
      title: 'Forma de Pagamento',
      content: Container(
        height: 150,
        child: Column(
          children: [
            Obx(
              () => RadioGroup<String>.builder(
                direction: Axis.vertical,
                groupValue: _paymentType.value,
                onChanged: (value) {
                  _paymentType(value);
                },
                items: ['Cartão de Credito', 'Cartão de Debito', 'Dinheiro'],
                itemBuilder: (item) => RadioButtonBuilder(
                  item,
                ),
              ),
            ),
          ],
        ),
      ),
      cancel: ElevatedButton(
        onPressed: () => Get.back(),
        style: ElevatedButton.styleFrom(onPrimary: Get.theme.primaryColor),
        child: Text('Cancelar'),
      ),
      confirm: ElevatedButton(
        onPressed: () {
          Get.back();
        },
        style: ElevatedButton.styleFrom(onPrimary: Get.theme.primaryColor),
        child: Text('Alterar'),
      ),
    );
  }

  @override
  Future<void> onInit() async {
    super.onInit();
    final sp = await SharedPreferences.getInstance();
    _user(UserModel.fromJson(sp.getString('user')!));
    messageListener(_message);
    loaderListener(_loading);
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {}

  checkout() async {
    if (address.isBlank!) {
      _message(
        MessageModel(
            title: 'Erro',
            message: 'Digite seu Endereço',
            type: MessageType.error),
      );
    } else if (paymentType.isBlank!) {
      _message(
        MessageModel(
            title: 'Erro',
            message: 'Selecione uma forma de pagamento',
            type: MessageType.error),
      );
    } else {
      try {
        _loading(true);
        await _repository.saveOrder(CheckoutInputModel(
          userId: _user.value!.id,
          address: address,
          paymentType: paymentType,
          itemsId: flavorSelected.map<int>((element) => element.id).toList(),
        ));
        _loading(false);
        _message(MessageModel(
            title: 'Sucesso',
            message: 'Pedido Realizado com Sucesso',
            type: MessageType.info));
        await 2.seconds.delay();
        Get.close(3);
      } catch (e) {
        print(e);
        _loading(false);
        _message(MessageModel(
            title: 'Erro',
            message: 'Erro ao registrar pedido',
            type: MessageType.error));
      }
    }
  }
}
