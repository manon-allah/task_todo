import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo_with_hive_cubit/logic/get_tasks/get_tasks_cubit.dart';
import 'package:todo_with_hive_cubit/model/todo_model.dart';
import 'package:todo_with_hive_cubit/view/widgets/custom_task_item.dart';

class CustomNoteListView extends StatelessWidget {
  const CustomNoteListView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<GetTasksCubit, GetTasksState>(
      listener: (context, state) {},
      builder: (context, state) {
        List<TodoModel> tasks =
            BlocProvider.of<GetTasksCubit>(context).tasks ?? [];
        return Padding(
          padding: const EdgeInsets.symmetric(vertical: 16),
          child: ListView.builder(
              itemCount: tasks.length,
              padding: EdgeInsets.zero,
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.symmetric(vertical: 5),
                  child: TaskItems(
                    task: tasks[index],
                  ),
                );
              }),
        );
      },
    );
  }
}
