import 'package:hive/hive.dart';

@HiveType(typeId: 0)
class NoteModel {
  @HiveField(0)
  final String title;

  @HiveField(1)
  final String details;

  @HiveField(2)
  final DateTime dateTime;

  @HiveField(3)
  final int color;

  NoteModel({
    required this.color,
    required this.title,
    required this.details,
    required this.dateTime,
  });
}
