import 'dart:developer';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive/hive.dart';
import 'package:note/consts.dart';
import 'package:note/cubits/add_note_cubit/add_note_state.dart';
import 'package:note/models/note_model.dart';

class AddNoteCubit extends Cubit<AddNoteStates> {
  AddNoteCubit() : super(NoteInitioalState());

  static AddNoteCubit get(context) => BlocProvider.of(context);

  addNote(NoteModel note) async {
    emit(
      AddNoteLoadState(),
    );
    try {
      var noteBox = Hive.box<NoteModel>(knoteBox);
      await noteBox.add(note);
      log("${noteBox.getAt(1)!.details}");
      emit(
        AddNoteSuccessState(),
      );
    } catch (e) {
      print(e);
      emit(
        AddNoteErrorState(error: e.toString()),
      );
    }
  }

  readNotes() async {
    emit(
      ReadNoteLoadState(),
    );

    try {
      var noteBox = Hive.box<NoteModel>(knoteBox);
      List<NoteModel> notes = [];
      for (int i = 0; i < noteBox.length; i++) {
        NoteModel? noteModel = noteBox.getAt(i);
        notes.add(noteModel!);
      }
      emit(
        ReadNoteSuccessState(notes: notes),
      );
      return notes;
    } catch (e) {
      print(e);
      emit(
        ReadNoteErrorState(error: e.toString()),
      );
    }
  }
}
