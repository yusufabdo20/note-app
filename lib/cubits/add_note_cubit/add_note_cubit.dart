import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive/hive.dart';
import 'package:note/cubits/add_note_cubit/add_note_state.dart';
import 'package:note/models/note_model.dart';

class AddNoteCubit extends Cubit<AddNoteStates> {
  AddNoteCubit() : super(NoteInitioalState());

  static AddNoteCubit get(context) => BlocProvider.of(context);
  // final List<NoteModel> noteModels = [];
  bool isLoading = false;

  addNote(NoteModel note) async {
    emit(
      AddNoteLoadState(),
    );
    // isLoading = true;
    try {
      var noteBox = Hive.box<NoteModel>("noteBox");
      await noteBox.add(note);
      // isLoading = false;
      emit(
        AddNoteSuccessState(),
      );
    } catch (e) {
      // isLoading = true;

      emit(
        AddNoteErrorState(error: e.toString()),
      );
    }
  }
}
