import 'package:flutter/material.dart';
import 'package:noteappwithphp/core/helpers/extentions.dart';
import 'package:noteappwithphp/core/models/note_model.dart';
import 'package:noteappwithphp/core/routing/routes.dart';
import 'package:noteappwithphp/core/widgets/custom_button.dart';
import 'package:noteappwithphp/core/widgets/cutom_textFormField.dart';

class EditNoteViewBody extends StatefulWidget {
  final NoteModel noteModel;
  const EditNoteViewBody({super.key, required this.noteModel});

  @override
  State<EditNoteViewBody> createState() => _EditNoteViewBodyState();
}

class _EditNoteViewBodyState extends State<EditNoteViewBody> {
  String? noteTitle;
  String? noteBody;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10),
      child: ListView(
        children: [
          CustomTextFormField(
            hint: "Note title",
            initialValue: widget.noteModel.noteTitle,
            onChanged: (value) {
              noteTitle = value;
            },
          ),
          CustomTextFormField(
            initialValue: widget.noteModel.noteBody,
            hint: "Note body",
            maxLines: 6,
            onChanged: (value) {
              noteBody = value;
            },
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
