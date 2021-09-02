import 'package:pizza_ja/app/helpers/rest_client.dart';
import 'package:pizza_ja/app/models/menu_model.dart';

class MenuRepository {
  final RestClient restClient;
  MenuRepository({
    required this.restClient,
  });

  Future<List<MenuModel>?> findAll() async {
    final response = await restClient.get<List<MenuModel>?>(
      '/menu/',
      decoder: (data) {
        if (data is List) {
          return data.map<MenuModel>((e) => MenuModel.fromMap(e)).toList();
        }
        return null;
      },
    );
    if (response.hasError) {
      throw RestClientException(message: 'Erro ao buscar cardápio');
    }
    return response.body;
  }
}
