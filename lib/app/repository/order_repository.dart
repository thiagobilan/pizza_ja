import 'package:pizza_ja/app/helpers/rest_client.dart';
import 'package:pizza_ja/app/models/order_model.dart';
import 'package:pizza_ja/app/view_models/checkout_input_model.dart';

class OrderRepository {
  final RestClient _restClient;

  OrderRepository(this._restClient);

  Future<List<OrderModel>?> findMyOrders(int userId) async {
    final response = await _restClient.get(
      '/order/user/$userId',
      decoder: (data) {
        print('DATA É: $data');
        if (data is List) {
          return data.map<OrderModel>((e) => OrderModel.fromMap(e)).toList();
        }
        return null;
      },
    );

    if (response.hasError) {
      print('ERROR:');

      print(response.statusCode);
      throw RestClientException(message: 'Erro ao buscar pedidosssss');
    }
    return response.body;
  }

  Future<void> saveOrder(CheckoutInputModel model) async {
    switch (model.paymentType) {
      case 'Cartão de Credito':
        model.paymentType = 'credito';
        break;
      case 'Cartão de Debito':
        model.paymentType = 'debito';
        break;
      case 'Dinheiro':
        model.paymentType = 'dinheiro';
        break;
      default:
    }
    final response = await _restClient.post('/order/', model.toMap());

    if (response.hasError) {
      print(response.statusCode);
      throw RestClientException(message: 'Erro ao registrar pedidos');
    }
  }
}
