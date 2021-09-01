import 'package:get/get.dart';

class RegisterController extends GetxController {
  final _obscureTextPassword = true.obs;
  final _obscureTextConfirmPassword = true.obs;
  get obscureTextPassword => _obscureTextPassword.value;
  get obscureTextConfirmPassword => _obscureTextConfirmPassword.value;
  void showHidePassword() => _obscureTextPassword.toggle();
  void showHideConfirmPassword() => _obscureTextConfirmPassword.toggle();
  final count = 0.obs;
  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {}
  void increment() => count.value++;
}
