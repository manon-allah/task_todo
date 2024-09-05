import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo_with_hive_cubit/logic/add_task/add_task_cubit.dart';
import 'package:todo_with_hive_cubit/logic/get_tasks/get_tasks_cubit.dart';
import 'package:todo_with_hive_cubit/view/widgets/add_task_form.dart';

class AddTaskButtonSheet extends StatelessWidget {
  const AddTaskButtonSheet({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AddTaskCubit, AddTaskState>(
      listener: (context, state) {
        if (state is AddTaskSuccess) {
          BlocProvider.of<GetTasksCubit>(context).getTasks();
          Navigator.pop(context);
        }
      },
      builder: (context, state) {
        return Padding(
          padding: EdgeInsets.only(
            left: 16,
            right: 16,
            bottom: MediaQuery.of(context).viewInsets.bottom,
          ),
          child: const SingleChildScrollView(
            child: AddTaskForm(),
          ),
        );
      },
    );
  }
}
