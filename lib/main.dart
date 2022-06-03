import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:getx/app/core/theme/app_theme.dart';
import 'package:getx/app/core/utils/dependency_injection.dart';
import 'package:getx/app/modules/home/home_binding.dart';
import 'package:getx/app/modules/home/home_page.dart';
import 'package:getx/app/modules/splash/splash_binding.dart';
import 'package:getx/app/modules/splash/splash_page.dart';
import 'package:getx/app/routes/app_pages.dart';

void main() async {
  await GetStorage.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      enableLog: true,
      debugShowCheckedModeBanner: false,
      onInit: () async {
        DependencyInjection.init();
      },
      initialRoute: Routes.splash,
      theme: appThemeData,
      defaultTransition: Transition.fade,
      initialBinding: SplashBinding(),
      getPages: AppPages.pages,
      home: SplashPage(),
    );
  }
}
