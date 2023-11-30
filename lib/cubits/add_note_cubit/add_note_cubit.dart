import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:note/cubits/add_note_cubit/add_note_state.dart';
import 'package:note/models/note_model.dart';

class NoteCubit extends Cubit<NoteStates> {
  NoteCubit() : super(NoteInitioalState());

  static NoteCubit get(context) => BlocProvider.of(context);
  final List<NoteModel> noteModels = [];
  addNote() {}
}
