import 'package:flutter/material.dart';
import 'package:todo_with_hive_cubit/model/todo_model.dart';
import 'package:todo_with_hive_cubit/view/widgets/task_edit_veiw_body.dart';

class TaskEditView extends StatelessWidget {
  const TaskEditView({super.key, required this.task});

  final TodoModel task;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: TaskEditVeiwBody(
        task: task,
      ),
    );
  }
}
