import 'package:hive/hive.dart';
part 'note_model.g.dart';

@HiveType(typeId: 0)
class NoteModel extends HiveObject {
  @HiveField(0)
  String title;

  @HiveField(1)
  String details;

  @HiveField(2)
  final String dateTime;

  @HiveField(3)
  final int color;

  NoteModel({
    required this.color,
    required this.title,
    required this.details,
    required this.dateTime,
  });
}
