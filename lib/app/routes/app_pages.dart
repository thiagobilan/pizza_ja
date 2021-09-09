import 'package:get/get.dart';

import 'package:pizza_ja/app/modules/home/bindings/home_binding.dart';
import 'package:pizza_ja/app/modules/home/views/home_view.dart';
import 'package:pizza_ja/app/modules/login/bindings/login_binding.dart';
import 'package:pizza_ja/app/modules/login/views/login_view.dart';
import 'package:pizza_ja/app/modules/menu/views/menu_view.dart';
import 'package:pizza_ja/app/modules/orders/bindings/orders_binding.dart';
import 'package:pizza_ja/app/modules/orders/views/orders_view.dart';
import 'package:pizza_ja/app/modules/register/bindings/register_binding.dart';
import 'package:pizza_ja/app/modules/register/views/register_view.dart';
import 'package:pizza_ja/app/modules/splash/bindings/splash_binding.dart';
import 'package:pizza_ja/app/modules/splash/views/splash_view.dart';

part 'app_routes.dart';

class AppPages {
  AppPages._();

  static const INITIAL = Routes.SPLASH;

  static final routes = [
    GetPage(
      name: _Paths.HOME,
      page: () => HomeView(),
      binding: HomeBinding(),
    ),
    GetPage(
      name: _Paths.SPLASH,
      page: () => SplashView(),
      binding: SplashBinding(),
    ),
    GetPage(
      name: _Paths.LOGIN,
      page: () => LoginView(),
      binding: LoginBinding(),
    ),
    GetPage(
      name: _Paths.REGISTER,
      page: () => RegisterView(),
      binding: RegisterBinding(),
    ),
    GetPage(
      name: _Paths.MENU,
      page: () => MenuView(
        pizzaSize: Get.arguments,
      ),
    ),
    GetPage(
      name: _Paths.ORDERS_PAGE,
      page: () => OrdersView(),
      binding: OrdersPageBinding(),
    ),
  ];
}
