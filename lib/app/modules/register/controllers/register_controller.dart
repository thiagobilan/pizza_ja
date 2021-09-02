import 'package:get/get.dart';
import 'package:pizza_ja/app/helpers/loader_mixin.dart';
import 'package:pizza_ja/app/helpers/messages_mixin.dart';
import 'package:pizza_ja/app/helpers/rest_client.dart';

import 'package:pizza_ja/app/repository/user_repository.dart';
import 'package:pizza_ja/app/view_models/register_user_input_model.dart';

class RegisterController extends GetxController
    with LoaderMixin, MessagesMixin {
  final UserRepository _repository;
  RegisterController(
    this._repository,
  );

  final _loading = false.obs;
  final _message = MessageModel().obs;
  final _obscureTextPassword = true.obs;
  final _obscureTextConfirmPassword = true.obs;
  get obscureTextPassword => _obscureTextPassword.value;
  get obscureTextConfirmPassword => _obscureTextConfirmPassword.value;
  void showHidePassword() => _obscureTextPassword.toggle();
  void showHideConfirmPassword() => _obscureTextConfirmPassword.toggle();

  Future<void> registerUser(String name, String email, String password) async {
    try {
      _loading(true);
      _message(null);
      final inputModel =
          RegisterUserInputModel(name: name, email: email, password: password);
      await _repository.salvar(inputModel);
      _loading(false);
      _message(MessageModel(
          title: 'Sucesso',
          message: 'Usuário cadastrado com sucesso',
          type: MessageType.info));
      await 1.seconds.delay();
      Get.close(2);
    } on RestClientException catch (e) {
      _loading(false);
      _message(MessageModel(
          title: "Erro", message: e.message, type: MessageType.error));
    } catch (e) {
      _loading(false);
      _message(MessageModel(
          title: "Erro",
          message: 'Erro ao registrar usuário',
          type: MessageType.error));
    }
  }

  @override
  void onInit() {
    super.onInit();
    loaderListener(_loading);
    messageListener(_message);
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {}
}
