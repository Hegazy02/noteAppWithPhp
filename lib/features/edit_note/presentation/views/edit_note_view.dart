import 'package:flutter/material.dart';
import 'package:noteappwithphp/core/models/note_model.dart';
import 'package:noteappwithphp/features/edit_note/presentation/views/widgets/edit_note_view_body.dart';

class EditNoteView extends StatelessWidget {
  final NoteModel noteModel;
  const EditNoteView({super.key, required this.noteModel});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(),
        body: SafeArea(
            child: EditNoteViewBody(
          noteModel: noteModel,
        )));
  }
}
