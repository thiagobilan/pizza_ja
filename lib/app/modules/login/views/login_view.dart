import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:pizza_ja/app/components/pizza_ja_button.dart';
import 'package:pizza_ja/app/components/pizza_ja_input.dart';
import 'package:pizza_ja/app/routes/app_pages.dart';

import '../controllers/login_controller.dart';

class LoginView extends GetView<LoginController> {
  final emailEditingController = TextEditingController();
  final passwordEditingController = TextEditingController();
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
                  width: 250,
                ),
                Container(
                  padding: const EdgeInsets.all(15),
                  child: Column(
                    children: [
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
                      Obx(() => PizzaJaInput(
                            controller: passwordEditingController,
                            label: 'Senha',
                            obscureText: controller.obscureText,
                            validator: (String? value) {
                              if (value!.length < 6) {
                                return 'Senha conter no mínimo 6 caracteres.';
                              }
                              return null;
                            },
                            suffixIcon: controller.obscureText
                                ? Icon(Icons.lock_open)
                                : Icon(Icons.lock_clock),
                            suffixIconOnPressed: controller.showHidePassword,
                          )),
                      SizedBox(
                        height: 20,
                      ),
                      PizzaJaButton(
                        width: Get.size.width * .8,
                        height: 50,
                        buttonColor: Get.theme.primaryColor,
                        label: 'Login',
                        labelColor: Colors.white,
                        labelSize: 20,
                        onPressed: () {
                          if (formKey.currentState!.validate()) {
                            controller.login(emailEditingController.text,
                                passwordEditingController.text);
                          }
                        },
                      ),
                      SizedBox(
                        height: 50,
                      ),
                      TextButton(
                        style: TextButton.styleFrom(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(25),
                          ),
                        ),
                        onPressed: () => Get.toNamed(Routes.REGISTER),
                        child: Text(
                          'Cadastre-se',
                          style: TextStyle(fontSize: 20, color: Colors.black),
                        ),
                      )
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
