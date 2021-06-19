import 'package:flutter/material.dart';

class InputField extends StatelessWidget {
  bool isPassword;
  String? hintText;

  InputField({this.isPassword = false, this.hintText});

  @override
  Widget build(BuildContext context) {
    return TextField(
      decoration: InputDecoration(labelText: hintText, hintText: hintText),
      obscureText: isPassword,
      style: TextStyle(
        fontSize: 20,
      ),
    );
  }
}
