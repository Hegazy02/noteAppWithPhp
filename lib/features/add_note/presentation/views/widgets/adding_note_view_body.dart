import 'package:flutter/material.dart';
import 'package:noteappwithphp/core/helpers/extentions.dart';
import 'package:noteappwithphp/core/routing/routes.dart';
import 'package:noteappwithphp/core/widgets/custom_button.dart';
import 'package:noteappwithphp/core/widgets/cutom_textFormField.dart';

class AddNoteViewBody extends StatefulWidget {
  const AddNoteViewBody({super.key});

  @override
  State<AddNoteViewBody> createState() => _AddNoteViewBodyState();
}

class _AddNoteViewBodyState extends State<AddNoteViewBody> {
  TextEditingController noteTitle = TextEditingController();
  TextEditingController noteBody = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10),
      child: ListView(
        children: [
          CustomTextFormField(controller: noteTitle, hint: "Note title"),
          CustomTextFormField(
            controller: noteBody,
            hint: "Note body",
            maxLines: 6,
          ),
          const SizedBox(
            height: 30,
          ),
          CustomButton(
            text: "Create note",
            onPressed: () {
              context.pushNamed(Routes.homeView);
            },
          )
        ],
      ),
    );
  }
}
