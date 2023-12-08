class NoteModel {
  final String noteTitle;
  final String noteBody;
  NoteModel({required this.noteTitle, required this.noteBody});
  factory NoteModel.fromMap({required Map map}) {
    return NoteModel(noteTitle: map['noteTitle'], noteBody: map['noteBody']);
  }
}
