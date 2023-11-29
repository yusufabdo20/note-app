import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:note/views/widgets/notes_view_body.dart';

class NotesScreen extends StatelessWidget {
  const NotesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          showModalBottomSheet(
              context: context,
              builder: (context) {
                return AddNoteBottomSheet();
              });
        },
        child: const Icon(
          Icons.add,
        ),
      ),
      body: const SafeArea(
        child: NotesViewBody(),
      ),
    );
  }
}

class AddNoteBottomSheet extends StatelessWidget {
  const AddNoteBottomSheet({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(10),
      child: Column(
        children: [
          TextField(),
          TextField(),
        ],
      ),
    );
  }
}
