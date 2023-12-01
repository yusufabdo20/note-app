import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:note/cubits/add_note_cubit/add_note_cubit.dart';
import 'package:note/cubits/add_note_cubit/add_note_state.dart';
import 'package:note/models/note_model.dart';
import 'package:note/views/widgets/custom_text_form_field.dart';

class AddNoteForm extends StatefulWidget {
  const AddNoteForm({
    super.key,
  });

  @override
  State<AddNoteForm> createState() => _AddNoteFormState();
}

class _AddNoteFormState extends State<AddNoteForm> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  AutovalidateMode autovalidateMode = AutovalidateMode.disabled;
  TextEditingController titleController = TextEditingController();
  TextEditingController detailsController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      autovalidateMode: autovalidateMode,
      child: Column(
        children: [
          CustomTextField(
            labelText: 'Title',
            controller: titleController,
            onSaved: (v) {
              titleController.text = v!;
            },
          ),
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.02,
          ),
          CustomTextField(
            labelText: 'Details',
            controller: detailsController,
            maxLines: 6,
            onSaved: (v) {
              detailsController.text = v!;
            },
          ),
          const Spacer(),
          BlocBuilder<AddNoteCubit, AddNoteStates>(
            builder: (context, state) {
              return CustomButton(
                isLoading: state is AddNoteLoadState ? true : false,
                title: "Add note",
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    _formKey.currentState!.save();
                    var nosteModel = NoteModel(
                      color: Colors.blueAccent.value,
                      title: titleController.text,
                      details: detailsController.text,
                      dateTime: "${DateTime.now()}",
                    );
                    AddNoteCubit.get(context).addNote(nosteModel);
                  } else {
                    autovalidateMode = AutovalidateMode.always;
                    setState(() {});
                  }
                },
              );
            },
          ),
        ],
      ),
    );
  }
}

class CustomButton extends StatelessWidget {
  const CustomButton({
    super.key,
    required this.onPressed,
    required this.title,
    this.isLoading = false,
  });
  final Function() onPressed;
  final String title;
  final bool isLoading;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
            backgroundColor: Colors.deepPurple,
            padding: EdgeInsets.symmetric(vertical: 5)),
        onPressed: onPressed,
        child: isLoading
            ? Center(child: const CircularProgressIndicator())
            : Text(title),
      ),
    );
  }
}
