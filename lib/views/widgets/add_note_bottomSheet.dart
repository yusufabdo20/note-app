import 'package:flutter/material.dart';

class AddNoteBottomSheet extends StatelessWidget {
  AddNoteBottomSheet({super.key});
  final TextEditingController editTitleController = TextEditingController();
  final TextEditingController editDetailsController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(20),
      child: Column(
        children: [
          CustomTextField(
            labelText: 'Title',
            controller: editTitleController,
          ),
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.02,
          ),
          CustomTextField(
            labelText: 'Details',
            controller: editDetailsController,
            maxLines: 6,
          ),
          Spacer(),
          Container(
            width: double.infinity,
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.deepPurple,
              ),
              onPressed: () {},
              child: Text("Add"),
            ),
          ),
        ],
      ),
    );
  }
}

class CustomTextField extends StatelessWidget {
  const CustomTextField(
      {super.key,
      required this.labelText,
      this.onSubmitted,
      this.maxLines = 1,
      this.hintText,
      this.controller});
  final int maxLines;
  final String labelText;
  final String? hintText;
  final TextEditingController? controller;
  final Function(String)? onSubmitted;
  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      decoration: InputDecoration(
        labelText: labelText,
        hintText: hintText,
        // hintStyle: TextStyle(),
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(16)),
      ),
      maxLines: maxLines,
      textAlign: TextAlign.center,
      onSubmitted: onSubmitted,
    );
  }
}
