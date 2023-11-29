import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:note/views/widgets/cuustom_app_bar.dart';
import 'package:note/views/widgets/note_item.dart';
import 'package:note/views/widgets/notesListViewBuilder.dart';

class NotesViewBody extends StatelessWidget {
  const NotesViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 15, left: 15, top: 10),
      child: Column(
        children: [
          CustomAppBar(),
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.01,
          ),
          NotesListViewBuilder(),
        ],
      ),
    );
  }
}
