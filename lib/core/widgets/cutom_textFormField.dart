import 'package:flutter/material.dart';
import 'package:noteappwithphp/core/theme/colors.dart';

class CustomTextFormField extends StatelessWidget {
  final TextEditingController controller;
  final String hint;
  const CustomTextFormField(
      {super.key, required this.controller, required this.hint});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: TextFormField(
          controller: controller,
          decoration: InputDecoration(
            hintText: hint,
            border: customBorder(),
            enabledBorder: customBorder(),
            errorBorder: customBorder(),
            focusedBorder: customBorder(),
            focusedErrorBorder: customBorder(),
          )),
    );
  }

  OutlineInputBorder customBorder() {
    return OutlineInputBorder(
        borderRadius: BorderRadius.circular(20),
        borderSide: const BorderSide(color: MyColors.primaryColor));
  }
}
