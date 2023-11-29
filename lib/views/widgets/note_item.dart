import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class NoteItem extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.lightGreen,
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            ListTile(
              contentPadding: EdgeInsets.all(5),
              title: Text(
                "Title",
                style: TextStyle(
                  fontSize: 20.sp,
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                ),
              ),
              subtitle: Text(
                "Sub Title",
                style: TextStyle(fontSize: 16.sp, color: Colors.black),
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
              ),
              trailing: IconButton(
                onPressed: () {},
                icon: const Icon(Icons.delete, color: Colors.black),
              ),
            ),
            const Text(
              "May 21 , 2023",
              style: TextStyle(
                height: 2.5,
                color: Colors.black,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
