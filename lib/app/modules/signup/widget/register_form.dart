import 'package:flutter/material.dart';
import 'package:flutter_animated_dialog/flutter_animated_dialog.dart';
import 'package:get/get.dart';
import 'package:getx/app/core/utils/percent_width_height.dart';
import 'package:getx/app/data/provider/authentication.dart';
import 'package:getx/app/modules/login/widgets/input_text.dart';
import 'package:getx/app/modules/signup/signup_controller.dart';
import 'package:getx/app/routes/app_pages.dart';

class RegisterForm extends StatefulWidget {
  @override
  _RegisterFormState createState() => _RegisterFormState();
}

class _RegisterFormState extends State<RegisterForm> {
  GlobalKey<FormState> _formKey = GlobalKey();
  String _email = "";
  String _password = "";
  String _username = "";
  String _phone = "";
  String _ci = '';

  _submit() async {
    Authentication auth = Get.find<Authentication>();
    SignupController spc = Get.find<SignupController>();

    if (spc.photo_path == null) {
      showAnimatedDialog(
        context: context,
        barrierDismissible: true,
        builder: (BuildContext context) {
          return ClassicGeneralDialogWidget(
            titleText: 'Error',
            contentText: 'La foto es requerida',
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
      return;
    }
    print('🎭 submit Registro');
    bool result = await auth.register(
      name: _username,
      email: _email,
      password: _password,
      phone: _phone,
      ci: _ci,
      foto_url: spc.photo_path!,
    );
    if (result) {
      showAnimatedDialog(
        context: context,
        barrierDismissible: true,
        builder: (BuildContext context) {
          return ClassicGeneralDialogWidget(
            titleText: 'Registro',
            contentText: 'El registro se ha realizado correctamente',
            onPositiveClick: () {
              Get.offNamedUntil(Routes.login, (route) => false);
            },
            negativeText: 'Ok',
          );
        },
        animationType: DialogTransitionType.size,
        curve: Curves.fastOutSlowIn,
        duration: Duration(seconds: 1),
      );
    } else {
      showAnimatedDialog(
        context: context,
        barrierDismissible: true,
        builder: (BuildContext context) {
          return ClassicGeneralDialogWidget(
            titleText: 'Error',
            contentText: 'El registro no se ha podido completar',
            onPositiveClick: () {
              Navigator.pop(context);
            },
            negativeText: 'Ok',
          );
        },
        animationType: DialogTransitionType.size,
        curve: Curves.fastOutSlowIn,
        duration: Duration(seconds: 1),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    // final Responsive responsive = Responsive.of(context);
    return Positioned(
      bottom: 30,
      left: 20,
      right: 20,
      child: Container(
        constraints: BoxConstraints(maxWidth: 360),
        child: Form(
          key: _formKey,
          child: Column(
            children: <Widget>[
              InputText(
                label: 'NOMBRE',
                keyboardType: TextInputType.emailAddress,
                fontSize: 1.4.dp,
                onChanged: (text) {
                  _username = text;
                },
                validator: (text) {
                  if (text != null && text.trim().length < 6) {
                    return "Invalid username";
                  }

                  return null;
                },
              ),
              InputText(
                label: 'C.I.',
                keyboardType: TextInputType.number,
                fontSize: 1.4.dp,
                onChanged: (text) {
                  _ci = text;
                },
                validator: (text) {
                  if (text != null && !text.contains('@')) {
                    return "Invalid email";
                  }
                  return null;
                },
              ),
              InputText(
                label: 'EMAIL',
                keyboardType: TextInputType.emailAddress,
                fontSize: 1.4.dp,
                onChanged: (text) {
                  _email = text;
                },
                validator: (text) {
                  if (text != null && !text.contains('@')) {
                    return "Invalid email";
                  }
                  return null;
                },
              ),
              InputText(
                label: 'CONTRASEÑA',
                keyboardType: TextInputType.emailAddress,
                fontSize: 1.4.dp,
                obscureText: true,
                onChanged: (text) {
                  _password = text;
                },
                validator: (text) {
                  if (text != null && text.trim().length < 5) {
                    return "contraseña invalida";
                  }
                  return null;
                },
              ),
              InputText(
                label: 'TELEFONO',
                keyboardType: TextInputType.number,
                fontSize: 1.4.dp,
                obscureText: true,
                onChanged: (text) {
                  _phone = text;
                },
                validator: (text) {
                  if (text != null && text.trim().length < 5) {
                    return "contraseña invalida";
                  }
                  return null;
                },
              ),
              SizedBox(height: 5.0.dp),
              SizedBox(
                width: double.infinity,
                child: TextButton(
                  onPressed: () {
                    this._submit();
                  },
                  child: Text(
                    'Registrarte',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 1.5.dp,
                    ),
                  ),
                  style: ButtonStyle(
                      backgroundColor:
                          MaterialStateProperty.all(Colors.pinkAccent),
                      padding: MaterialStateProperty.all(
                          EdgeInsets.symmetric(vertical: 15))),
                ),
              ),
              SizedBox(
                height: 3.0.dp,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text('¿Tienes una cuenta?',
                      style: TextStyle(fontSize: 1.5.dp)),
                  TextButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    child: Text(
                      'Inicia Sesion',
                      style:
                          TextStyle(color: Colors.pinkAccent, fontSize: 1.5.dp),
                    ),
                  ),
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
}
