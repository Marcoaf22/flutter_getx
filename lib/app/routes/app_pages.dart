import 'package:get/get.dart';
import 'package:getx/app/modules/home/home_binding.dart';
import 'package:getx/app/modules/home/home_page.dart';
import 'package:getx/app/modules/login/login_binding.dart';
import 'package:getx/app/modules/login/login_page.dart';
import 'package:getx/app/modules/signup/signup_binding.dart';
import 'package:getx/app/modules/signup/signup_page.dart';
import 'package:getx/app/modules/splash/splash_page.dart';
part './app_routes.dart';

abstract class AppPages {
  static final pages = [
    GetPage(
      name: Routes.initial,
      page: () => SplashPage(),
    ),
    GetPage(
      name: Routes.home,
      page: () => HomePage(),
      binding: HomeBinding(),
      transition: Transition.leftToRight,
    ),
    GetPage(
      name: Routes.login,
      page: () => LoginPage(),
      binding: LoginBinding(),
      transition: Transition.leftToRight,
    ),
    GetPage(
        name: Routes.signup,
        page: () => SignupPage(),
        binding: SignupBinding()),
  ];
}
