import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeController extends GetxController {
  HomeController();

  @override
  void onInit() async {
    super.onInit();
  }

  void onTap(index) {
    update();
  }

  void initScan() {
    Get.defaultDialog(
        onConfirm: () {
          Get.back();
        },
        onWillPop: () async {
          return true;
        },
        radius: 50,
        middleText: "Dialog made in 3 lines of code");

    Future.delayed(Duration(seconds: 3), () {
      Get.back();
    });
  }
}
