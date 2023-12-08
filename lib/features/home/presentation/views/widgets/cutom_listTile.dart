import 'package:flutter/material.dart';
import 'package:noteappwithphp/core/theme/styles.dart';

class CustomListTile extends StatelessWidget {
  final String noteTitle;
  final String noteBody;
  final void Function()? onTap;
  const CustomListTile(
      {super.key,
      required this.noteTitle,
      required this.noteBody,
      required this.onTap});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        onTap: onTap,
        title: Text(
          noteTitle,
          style: Styles.style16WPrimaryBoldCairo,
        ),
        subtitle: Text(
          noteBody,
          style: Styles.style12WBlackRegularCairo,
        ),
      ),
    );
  }
}
