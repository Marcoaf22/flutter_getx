import 'package:flutter/material.dart';
import 'package:getx/app/core/utils/percent_width_height.dart';
import 'package:getx/app/modules/login/widgets/circle.dart';
import 'package:getx/app/modules/login/widgets/icon_container.dart';
import 'package:getx/app/modules/login/widgets/login_form.dart';

class LoginPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final double bigCircle = 85.0.wp;
    final double littleCircle = 50.0.wp;

    return Scaffold(
      backgroundColor: Colors.grey,
      body: GestureDetector(
        onTap: () {
          FocusScope.of(context).unfocus();
        },
        child: SingleChildScrollView(
          child: Container(
            width: 100.0.wp,
            height: 100.0.hp,
            // color: Colors.black,
            child: Stack(
              alignment: Alignment.center,
              children: <Widget>[
                Positioned(
                  top: -(bigCircle) * 0.4,
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
                  top: -(littleCircle) * 0.4,
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
                  top: bigCircle * 0.35,
                  child: Column(
                    children: <Widget>[
                      IconContainer(
                        size: 17.0.wp,
                      ),
                      SizedBox(
                        height: 1.4.dp,
                      ),
                      Text(
                        'Hello Again \nWelcome Back!',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 1.7.dp,
                        ),
                      )
                    ],
                  ),
                ),
                LoginForm(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
