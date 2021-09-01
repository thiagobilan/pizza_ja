import 'package:get/get.dart';
import 'package:pizza_ja/app/helpers/rest_client.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'package:pizza_ja/app/helpers/loader_mixin.dart';
import 'package:pizza_ja/app/helpers/messages_mixin.dart';
import 'package:pizza_ja/app/repository/user_repository.dart';
import 'package:pizza_ja/app/routes/app_pages.dart';

class LoginController extends GetxController with LoaderMixin, MessagesMixin {
  final message = MessageModel().obs;
  final loading = false.obs;
  final UserRepository _repository;
  LoginController(this._repository);

  final _obscureText = true.obs;
  get obscureText => _obscureText.value;

  void showHidePassword() => _obscureText.toggle();

  Future<void> login(email, password) async {
    try {
      loading(true);
      final user = await _repository.login(email, password);
      final sp = await SharedPreferences.getInstance();
      await sp.setString('user', user.toJson());
      Get.offAllNamed(Routes.SPLASH);
      loading(false);
    } on RestClientException catch (e) {
      print(e);
      loading(false);
      message(MessageModel(
          title: 'Erro', message: e.message, type: MessageType.error));
    } catch (e) {
      loading(false);
      message(MessageModel(
          title: 'Erro',
          message: 'Erro ao autenticar usuário',
          type: MessageType.error));
    }
  }

  @override
  void onInit() {
    loaderListener(loading);
    messageListener(message);
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {}
}
