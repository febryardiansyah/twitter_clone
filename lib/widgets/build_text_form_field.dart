import 'package:flutter/material.dart';
import 'package:twitter_clone/utils/base_color.dart';

class BuildTextFormField extends StatelessWidget {
  final String hint;
  final TextEditingController textEditingController;
  final bool isObscure;
  final TextInputType textInputType;

  BuildTextFormField({this.hint, this.textEditingController,this.isObscure = false,this.textInputType});

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: textEditingController,
      style: TextStyle(color: BaseColor.white),
      keyboardType: textInputType,
      obscureText: isObscure,
      decoration: InputDecoration(
        hintText: hint,
        hintStyle: TextStyle(color: BaseColor.grey),
      ),
    );
  }
}
