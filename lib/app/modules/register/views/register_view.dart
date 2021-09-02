import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:pizza_ja/app/components/pizza_ja_button.dart';
import 'package:pizza_ja/app/components/pizza_ja_input.dart';
import 'package:pizza_ja/app/routes/app_pages.dart';

import '../controllers/register_controller.dart';

class RegisterView extends GetView<RegisterController> {
  final nameEditingController = TextEditingController();
  final emailEditingController = TextEditingController();
  final passwordEditingController = TextEditingController();
  final passwordConfirmEditingController = TextEditingController();
  final formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
      child: SingleChildScrollView(
        child: SizedBox(
          width: Get.size.width,
          child: Form(
            key: formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(
                  height: 20,
                ),
                Image.asset(
                  'assets/images/logo.png',
                  width: Get.size.width * .36,
                ),
                Container(
                  padding: const EdgeInsets.all(15),
                  child: Column(
                    children: [
                      PizzaJaInput(
                        controller: nameEditingController,
                        label: 'Nome',
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Nome inválido';
                          }
                          return null;
                        },
                      ),
                      PizzaJaInput(
                        controller: emailEditingController,
                        label: 'E-Mail',
                        validator: (value) {
                          if (value == null ||
                              value.isEmpty ||
                              !value.isEmail) {
                            return 'E-mail inválido';
                          }
                          return null;
                        },
                      ),
                      Obx(
                        () => PizzaJaInput(
                          controller: passwordEditingController,
                          label: 'Senha',
                          obscureText: controller.obscureTextPassword,
                          validator: (String? value) {
                            if (value!.length < 6) {
                              return 'Senha conter no mínimo 6 caracteres.';
                            }
                            return null;
                          },
                          suffixIcon: controller.obscureTextPassword
                              ? Icon(Icons.lock_open)
                              : Icon(Icons.lock_clock),
                          suffixIconOnPressed: controller.showHidePassword,
                        ),
                      ),
                      Obx(
                        () => PizzaJaInput(
                          controller: passwordConfirmEditingController,
                          label: 'Confirmar Senha',
                          obscureText: controller.obscureTextConfirmPassword,
                          validator: (String? value) {
                            // ignore: unrelated_type_equality_checks
                            if (value != passwordEditingController.text) {
                              return 'Senha e Confirmar Senha são diferentes.';
                            }
                            return null;
                          },
                          suffixIcon: controller.obscureTextConfirmPassword
                              ? Icon(Icons.lock_open)
                              : Icon(Icons.lock_clock),
                          suffixIconOnPressed:
                              controller.showHideConfirmPassword,
                        ),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      PizzaJaButton(
                        width: Get.size.width * .8,
                        height: 50,
                        buttonColor: Get.theme.primaryColor,
                        label: 'Salvar',
                        labelColor: Colors.white,
                        labelSize: 20,
                        onPressed: () {
                          if (formKey.currentState!.validate()) {
                            controller.registerUser(
                                nameEditingController.text,
                                emailEditingController.text,
                                passwordEditingController.text);
                          }
                        },
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      PizzaJaButton(
                        width: Get.size.width * .8,
                        height: 50,
                        label: 'Voltar',
                        labelColor: Colors.black,
                        labelSize: 20,
                        onPressed: () => Get.back(),
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    ));
  }
}
