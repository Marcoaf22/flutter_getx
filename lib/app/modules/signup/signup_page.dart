import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx/app/core/utils/percent_width_height.dart';
import 'package:getx/app/data/provider/remote/image_api.dart';
import 'package:getx/app/modules/login/widgets/circle.dart';
import 'package:getx/app/modules/signup/signup_controller.dart';
import 'package:getx/app/modules/signup/widget/avatar_buttom.dart';
import 'package:getx/app/modules/signup/widget/register_form.dart';

class SignupPage extends GetView<SignupController> {
  @override
  Widget build(BuildContext context) {
    final double bigCircle = 85.0.wp;
    final double littleCircle = 50.0.wp;

    return GetBuilder<SignupController>(
      init: SignupController(),
      builder: (_) {
        return Scaffold(
          body: GestureDetector(
            onTap: () {
              FocusScope.of(context).unfocus();
            },
            child: SingleChildScrollView(
              child: Container(
                width: Get.width,
                height: Get.height,
                // color: Colors.black,
                child: Stack(
                  alignment: Alignment.center,
                  children: <Widget>[
                    Positioned(
                      top: -(bigCircle) * 0.35,
                      right: -(bigCircle) * 0.2,
                      child: Circle(
                        size: 85.0.wp,
                        colors: [
                          Colors.purple,
                          Colors.deepPurple,
                        ],
                      ),
                    ),
                    Positioned(
                      top: -(littleCircle) * 0.2,
                      left: -(littleCircle) * 0.2,
                      child: Circle(
                        size: 50.0.wp,
                        colors: [
                          Colors.orange,
                          Colors.deepOrangeAccent,
                        ],
                      ),
                    ),
                    Positioned(
                      top: bigCircle * 0.22,
                      child: Column(
                        children: <Widget>[
                          Text(
                            'Bienvenido\nRegistrate para empezar!!',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              fontSize: 1.7.dp,
                              color: Colors.white,
                            ),
                          ),
                          SizedBox(
                            height: 3.0.dp,
                          ),
                          GetBuilder<SignupController>(
                            id: 'avatar',
                            builder: (_) {
                              return AvatarButtom(
                                withButton: false,
                                url: _.photo_path,
                                onPressed: () async {
                                  // String? path = await Extras.pickImage(true);
                                  // ImageAPI ho = ImageAPI();
                                  // if (path != null) {
                                  // String? img_path =
                                  // await ho.uploadImage(path);
                                  // if (img_path != null) {
                                  // _.setImagePath(img_path);
                                  // }
                                  // }
                                },
                                imageSize: 25.0.wp,
                              );
                            },
                          )
                        ],
                      ),
                    ),
                    RegisterForm(),
                    Positioned(
                      left: 15,
                      top: 15,
                      child: SafeArea(
                        child: CupertinoButton(
                          color: Colors.black26,
                          padding: EdgeInsets.all(10),
                          borderRadius: BorderRadius.circular(30),
                          child: Icon(
                            Icons.arrow_back,
                          ),
                          onPressed: () {
                            Navigator.pop(context);
                          },
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
