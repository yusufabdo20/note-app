import 'package:flutter/material.dart';
import 'package:note/views/widgets/add_note_bottomSheet.dart';
import 'package:note/views/widgets/cuustom_app_bar.dart';

class EditNoteView extends StatelessWidget {
  const EditNoteView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(child: EditNoteBody()),
    );
  }
}

class EditNoteBody extends StatelessWidget {
  final TextEditingController editTitleController = TextEditingController();
  final TextEditingController editDetailsController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(20),
      child: Column(
        children: [
          CustomAppBar(
            title: "Edit Note",
            icon: Icon(
              Icons.done_outline_rounded,
            ),
            onPressed: () {},
          ),
          CustomTextField(
            labelText: 'Title',
            controller: editTitleController,
            hintText: "Hello Iam Title",
          ),
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.02,
          ),
          CustomTextField(
            labelText: 'Details',
            controller: editDetailsController,
            maxLines: 6,
            hintText: "Hello Iam Details",
          ),
        ],
      ),
    );
  }
}
