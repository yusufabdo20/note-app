// ignore_for_file: public_member_api_docs, sort_constructors_first
sealed class NoteStates {}

class NoteInitioalState extends NoteStates {}

class AddNoteErrorState extends NoteStates {
  String error;
  AddNoteErrorState({
    required this.error,
  });
}

class AddNoteSuccessState extends NoteStates {}

class AddNoteLoadState extends NoteStates {}
