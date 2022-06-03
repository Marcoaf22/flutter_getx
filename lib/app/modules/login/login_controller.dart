import 'package:get/get.dart';
import 'package:getx/app/core/utils/user_info.dart';
import 'package:getx/app/data/provider/authentication.dart';

class LoginController extends GetxController {
  LoginController();

  @override
  void onInit() {
    print('INICIANDO LOGIN CONTROLLER');
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  Future<bool> signIn(String email, String password) async {
    print('👚 signIn');
    Authentication auth = Get.find<Authentication>();
    bool isOk = await auth.login(email: email, password: password);
    UserInfo.i.setValue();

    print('valor isOk: $isOk');
    return isOk;
  }
}
