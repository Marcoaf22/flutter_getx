import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

typedef Validando<T> = String? Function(String? value);

class InputText extends StatelessWidget {
  final String label;
  final bool obscureText;
  final TextInputType keyboardType;
  final bool borderEnable;
  final double fontSize;
  final void Function(String text) onChanged;
  // final String Function(String text) validator;
  final Validando<String>? validator;

  const InputText(
      {Key? key,
      this.label = '',
      required this.keyboardType,
      this.obscureText = false,
      this.borderEnable = true,
      this.fontSize = 15,
      required this.onChanged,
      this.validator})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      keyboardType: this.keyboardType,
      obscureText: this.obscureText,
      onChanged: this.onChanged,
      validator: this.validator,
      style: TextStyle(
        fontSize: this.fontSize,
      ),
      decoration: InputDecoration(
        labelText: this.label,
        contentPadding: EdgeInsets.symmetric(vertical: 5),
        enabledBorder: this.borderEnable
            ? UnderlineInputBorder(
                borderSide: BorderSide(
                  color: Colors.black12,
                ),
              )
            : InputBorder.none,
        labelStyle: TextStyle(
          color: Colors.black45,
          fontWeight: FontWeight.w500,
        ),
      ),
    );
  }
}
