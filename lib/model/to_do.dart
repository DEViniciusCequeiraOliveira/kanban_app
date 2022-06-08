import 'package:kanban_app/model/checklist.dart';

class ToDoModel {
  final String? title;
  final DateTime? date;
  final List<String>? comments;
  final List<Checklist>? task;
  //final Map<String, bool>? task;

  ToDoModel({required this.title, this.date, this.comments, this.task});
}
