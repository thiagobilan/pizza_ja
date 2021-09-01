import 'package:pizza_ja/app/helpers/rest_client.dart';
import 'package:pizza_ja/app/models/user_model.dart';

class UserRepository {
  final RestClient restClient;
  UserRepository({
    required this.restClient,
  });

  Future<UserModel> login(email, password) async {
    final response = await restClient.post(
      '/user/auth',
      {"email": email, "password": password},
      decoder: (data) => UserModel.fromMap(data),
    );
    if (response.hasError) {
      var message = 'Erro ao autenticar usuário!';
      if (response.statusCode == 403) {
        message = 'Usuário ou senha inválidos';
      }
      throw RestClientException(message: message);
    }
    return response.body!;
  }
}
