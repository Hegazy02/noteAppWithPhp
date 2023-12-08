import 'package:flutter/material.dart';
import 'package:noteappwithphp/core/theme/colors.dart';

class CustomTextFormField extends StatelessWidget {
  final TextEditingController? controller;
  final String hint;
  final String? initialValue;
  final int? maxLines;
  final void Function(String)? onChanged;
  const CustomTextFormField(
      {super.key,
      this.controller,
      required this.hint,
      this.maxLines,
      this.initialValue,
      this.onChanged});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: TextFormField(
          initialValue: initialValue,
          controller: controller,
          maxLines: maxLines,
          onChanged: onChanged,
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
