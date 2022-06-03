import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:getx/app/core/utils/user_info.dart';
import 'package:getx/app/data/model/auth.dart';
import 'package:getx/app/modules/home/home_page.dart';
import 'package:getx/app/routes/app_pages.dart';

class SplashController extends GetxController {
  SplashController();

  @override
  void onInit() {
    super.onInit();
    print('👨‍🎓 entrando con next');
    // next();
  }

  @override
  void onReady() {
    super.onReady();
    check();
  }

  @override
  void onClose() {
    print('🧧 SPLASH CONTROLLER ONCLOSE');
    super.onClose();
  }

  void check() async {
    print('🎀 Verificando token');
    // final String session = await Auth.instance.accessToken;
    final box = GetStorage();
    print(box.read(Auth.instance.key));

    Future.delayed(const Duration(seconds: 2), () {
      Get.to(
        HomePage(),
        transition: Transition.leftToRight,
      );
    });

    // if (box.read(Auth.instance.key) != null) {
    //   print('🎇 Entrando y verificando el token');
    //   await UserInfo.i.setValue();
    //   // Solicitudes.i.getValue();
    //   Get.offNamedUntil(Routes.home, (route) => false);
    // } else {
    //   Get.offNamedUntil(Routes.login, (route) => false);
    // }
  }
}
