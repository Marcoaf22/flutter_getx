import 'package:flutter/material.dart';
import 'package:flutter_animated_dialog/flutter_animated_dialog.dart';
import 'package:get/get.dart';
import 'package:getx/app/core/utils/percent_width_height.dart';
import 'package:getx/app/modules/login/login_controller.dart';
import 'package:getx/app/modules/login/widgets/input_text.dart';
import 'package:getx/app/modules/signup/signup_page.dart';
import 'package:getx/app/routes/app_pages.dart';

class LoginForm extends StatefulWidget {
  @override
  _LoginFormState createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
  GlobalKey<FormState> _formKey = GlobalKey();
  String _email = "";
  String _password = "";

  @override
  Widget build(BuildContext context) {
    // final Responsive responsive = Responsive.of(context)
    return Positioned(
      bottom: 30,
      left: 20,
      right: 20,
      child: Container(
        // constraints: BoxConstraints(maxWidth: responsive.isTable ? 430 : 360),
        constraints: BoxConstraints(maxWidth: 360),
        child: Form(
          key: _formKey,
          child: Column(
            children: <Widget>[
              InputText(
                label: 'EMAIL',
                keyboardType: TextInputType.emailAddress,
                fontSize: 1.4.dp,
                onChanged: (text) {
                  _email = text;
                },
                validator: (text) {
                  String txt = text ?? '';
                  if (!txt.contains('@')) {
                    return "Invalid email";
                  }
                  return null;
                },
              ),
              Container(
                decoration: BoxDecoration(
                    border: Border(
                        bottom: BorderSide(
                  color: Colors.black12,
                ))),
                child: Row(
                  children: <Widget>[
                    Expanded(
                      child: InputText(
                        label: 'CONTRASEñA',
                        onChanged: (text) {
                          _password = text;
                        },
                        keyboardType: TextInputType.text,
                        validator: (text) {
                          if (text != null) {
                            if (text.trim().length < 5) {
                              return "Invalid password";
                            }
                          }
                          return null;
                        },
                        obscureText: true,
                        borderEnable: false,
                        fontSize: 1.4.dp,
                      ),
                    ),
                    TextButton(
                      onPressed: () {},
                      style: TextButton.styleFrom(
                          padding: EdgeInsets.symmetric(vertical: 10)),
                      child: Text(
                        '¿Olvidaste tu contraseña?',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Colors.black54,
                          fontSize: 1.2.dp,
                        ),
                      ),
                    )
                  ],
                ),
              ),
              SizedBox(
                height: 5.0.dp,
              ),
              SizedBox(
                width: double.infinity,
                child: TextButton(
                  onPressed: () {
                    this._submit();
                  },
                  child: Text(
                    'Iniciar sesion',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 1.5.dp,
                    ),
                  ),
                  style: ButtonStyle(
                    backgroundColor:
                        MaterialStateProperty.all(Colors.pinkAccent),
                    padding: MaterialStateProperty.all(
                        EdgeInsets.symmetric(vertical: 15)),
                  ),
                ),
              ),
              SizedBox(
                height: 3.0.dp,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text(
                    '¿Eres nuevo?',
                    style: TextStyle(fontSize: 1.5.dp),
                  ),
                  TextButton(
                    child: Text(
                      'Registrate',
                      style:
                          TextStyle(color: Colors.pinkAccent, fontSize: 1.5.dp),
                    ),
                    onPressed: () {
                      Get.to(
                        SignupPage(),
                        transition: Transition.leftToRight,
                      );
                    },
                  )
                ],
              ),
              SizedBox(
                height: 10.0.dp,
              )
            ],
          ),
        ),
      ),
    );
  }

  _submit() async {
    final isOk = _formKey.currentState?.validate();
    // final isOk = true;
    if (isOk != null && isOk) {
      FocusScope.of(context).unfocus();

      LoginController c = Get.find<LoginController>();
      bool next = await c.signIn(this._email, this._password);
      print(next);
      if (next) {
        // print(isOk);
        // if (isOk) {
        Get.offNamedUntil(Routes.home, (route) => false);
        // }
      } else {
        showAnimatedDialog(
          context: context,
          barrierDismissible: true,
          builder: (BuildContext context) {
            return ClassicGeneralDialogWidget(
              titleText: 'Error',
              contentText: 'El email o contraseña incorrectos',
              onNegativeClick: () {
                Navigator.of(context).pop();
              },
              negativeText: 'cerrar',
            );
          },
          animationType: DialogTransitionType.size,
          curve: Curves.fastOutSlowIn,
          duration: Duration(seconds: 1),
        );
      }
    }
  }
}
