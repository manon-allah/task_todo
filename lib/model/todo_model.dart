import 'package:hive/hive.dart';
part 'todo_model.g.dart';

@HiveType(typeId: 0)
class TodoModel extends HiveObject {
  @HiveField(0)
  String task;
  @HiveField(1)
  String date;

  TodoModel({
    required this.task,
    required this.date,
  });
}
