import 'package:pizza_ja/app/helpers/rest_client.dart';
import 'package:pizza_ja/app/models/user_model.dart';
import 'package:pizza_ja/app/view_models/register_user_input_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

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

  Future<void> salvar(RegisterUserInputModel model) async {
    print('TENTANDO! ${model.name} e ${model.email} e ${model.password}');
    final response = await restClient.post('/user/',
        {'name': model.name, 'email': model.email, 'password': model.password});
    if (response.hasError) {
      throw RestClientException(message: 'Erro ao registrar Cliente');
    }
  }
}
