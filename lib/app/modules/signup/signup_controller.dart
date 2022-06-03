import 'package:get/get.dart';

class SignupController extends GetxController {
  String? photo_path;

  void setImagePath(String path) {
    photo_path = path;
    update(['avatar']);
  }
}
