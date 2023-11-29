import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:note/views/widgets/cuustom_app_bar.dart';

class NotesViewBody extends StatelessWidget {
  const NotesViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: Column(
        children: [
          CustomAppBar(),
          Expanded(
            child: ListView.builder(itemBuilder: (context, index) {
              return NoteItem();
            }),
          ),
        ],
      ),
    );
  }
}

class NoteItem extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            ListTile(
              contentPadding: EdgeInsets.all(5),
              title: Text(
                "Title",
              ),
              subtitle: Text(
                "Sub Title",
                style: TextStyle(),
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
              ),
              trailing: IconButton(
                onPressed: () {},
                icon: const Icon(
                  Icons.delete,
                ),
              ),
            ),
            const Text(
              "May 21 , 2023",
              style: TextStyle(
                height: 2.5,
                color: Colors.grey,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
