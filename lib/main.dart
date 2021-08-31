import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:pizza_ja/app/config/ui_config.dart';

import 'app/routes/app_pages.dart';

void main() {
  runApp(
    GetMaterialApp(
      theme: UiConfig.appTheme,
      debugShowCheckedModeBanner: false,
      title: "Application",
      initialRoute: AppPages.INITIAL,
      getPages: AppPages.routes,
    ),
  );
}
