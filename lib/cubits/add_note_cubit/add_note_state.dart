// ignore_for_file: public_member_api_docs, sort_constructors_first
sealed class AddNoteStates {}

class NoteInitioalState extends AddNoteStates {}

class AddNoteErrorState extends AddNoteStates {
  String error;
  AddNoteErrorState({
    required this.error,
  });
}

class AddNoteSuccessState extends AddNoteStates {}

class AddNoteLoadState extends AddNoteStates {}
