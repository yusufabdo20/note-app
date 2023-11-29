import 'package:flutter/material.dart';
import 'package:note/views/widgets/note_item.dart';

class NotesListViewBuilder extends StatelessWidget {
  const NotesListViewBuilder({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView.builder(itemBuilder: (context, index) {
        return NoteItem();
      }),
    );
  }
}
