import 'package:flutter/material.dart';
import 'package:noteappwithphp/features/add_note/presentation/views/widgets/adding_note_view_body.dart';

class AddNoteView extends StatelessWidget {
  const AddNoteView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(), body: const SafeArea(child: AddNoteViewBody()));
  }
}
