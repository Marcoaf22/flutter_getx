import 'package:get/get.dart';
import 'package:getx/app/modules/home/home_controller.dart';

class HomeBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<HomeController>(() => HomeController());
    //u otro servicio
  }
}

// import 'package:get/get.dart';

// class MyPageBinding implements Bindings {
// @override
// void dependencies() {
//   Get.lazyPut<MyPageController>(() => MyPageController(
//      MyPageRepository(MyApi())));
//   }
// }