import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'package:note/cubits/add_note_cubit/add_note_cubit.dart';
import 'package:note/cubits/add_note_cubit/add_note_state.dart';
import 'package:note/cubits/notes_cubit/notes_cubit.dart';
import 'package:note/views/widgets/add_note_form.dart';

class AddNoteBottomSheet extends StatelessWidget {
  const AddNoteBottomSheet({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AddNoteCubit(),
      child: Container(
        padding: const EdgeInsets.all(20),
        child: BlocConsumer<AddNoteCubit, AddNoteStates>(
          listener: (context, state) async {
            if (state is AddNoteErrorState) {
              log("ERRORR in AddNoteBottomSheet  listener : ${state.error}");
              await Fluttertoast.showToast(
                  msg: "There is Error: ${state.error}",
                  toastLength: Toast.LENGTH_LONG,
                  gravity: ToastGravity.BOTTOM,
                  backgroundColor: Colors.red,
                  textColor: Colors.white,
                  fontSize: 16.0);
            }
            if (state is AddNoteSuccessState) {
              await Fluttertoast.showToast(
                  msg: "Added New Note",
                  toastLength: Toast.LENGTH_LONG,
                  gravity: ToastGravity.BOTTOM,
                  // backgroundColor: Colors.,
                  textColor: Colors.white,
                  fontSize: 16.0);
              BlocProvider.of<NotesCubit>(context).readAllNotes();

              Navigator.pop(context);
            }
          },
          builder: (context, state) {
            return AbsorbPointer(
              absorbing: state is AddNoteLoadState ? true : false,
              child: const AddNoteForm(),
            );
          },
        ),
      ),
    );
  }
}
