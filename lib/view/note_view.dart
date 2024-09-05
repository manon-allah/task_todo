import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo_with_hive_cubit/logic/get_tasks/get_tasks_cubit.dart';
import 'package:todo_with_hive_cubit/view/widgets/add_task_button_sheet.dart';
import 'package:todo_with_hive_cubit/view/widgets/note_view_body.dart';

class TaskView extends StatelessWidget {
  const TaskView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<GetTasksCubit, GetTasksState>(
      listener: (context, state) {},
      builder: (context, state) {
        return Scaffold(
          // resizeToAvoidBottomInset: false,
          floatingActionButton: FloatingActionButton(
            backgroundColor: Colors.cyan[200],
            onPressed: () {
              showModalBottomSheet(
                  isScrollControlled: true,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(24),
                  ),
                  context: context,
                  builder: (context) {
                    return const AddTaskButtonSheet();
                  });
            },
            child: const Icon(
              Icons.add,
              color: Colors.black,
            ),
          ),
          body: const TaskViewBody(),
        );
      },
    );
  }
}
