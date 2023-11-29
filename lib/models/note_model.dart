// ignore_for_file: public_member_api_docs, sort_constructors_first
class NoteModel {
  final String title;
  final String details;
  final DateTime dateTime;
  final int color;
  NoteModel({
    required this.color,
    required this.title,
    required this.details,
    required this.dateTime,
  });
}
