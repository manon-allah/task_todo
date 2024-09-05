import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo_with_hive_cubit/logic/get_tasks/get_tasks_cubit.dart';
import 'package:todo_with_hive_cubit/model/todo_model.dart';
import 'package:todo_with_hive_cubit/view/widgets/custom_app_bar.dart';
import 'package:todo_with_hive_cubit/view/widgets/custom_text_field.dart';

class TaskEditVeiwBody extends StatefulWidget {
  const TaskEditVeiwBody({super.key, required this.task});

  final TodoModel task;

  @override
  State<TaskEditVeiwBody> createState() => _TaskEditVeiwBodyState();
}

class _TaskEditVeiwBodyState extends State<TaskEditVeiwBody> {
  String? title, content;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24),
      child: Column(
        children: [
          const SizedBox(
            height: 70,
          ),
          CustomAppBar(
            onPressed: () {
              widget.task.task = title ?? widget.task.task;
              widget.task.date = content ?? widget.task.date;
              widget.task.save();
              BlocProvider.of<GetTasksCubit>(context).getTasks();
              Navigator.pop(context);
            },
            icon: Icons.check,
            titleApp: 'Edit Task',
          ),
          const SizedBox(
            height: 50,
          ),
          CustomTextField(
            onChanged: (value) {
              title = value;
            },
            textHint: widget.task.task,
          ),
          const SizedBox(
            height: 20,
          ),
          CustomTextField(
            onChanged: (value) {
              content = value;
            },
            textHint: widget.task.date,
            maxLine: 1,
          ),
        ],
      ),
    );
  }
}
