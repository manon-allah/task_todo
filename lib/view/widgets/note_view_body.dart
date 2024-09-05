import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo_with_hive_cubit/logic/get_tasks/get_tasks_cubit.dart';
import 'package:todo_with_hive_cubit/view/widgets/custom_app_bar.dart';
import 'package:todo_with_hive_cubit/view/widgets/custom_task_list_view.dart';

class TaskViewBody extends StatefulWidget {
  const TaskViewBody({super.key});

  @override
  State<TaskViewBody> createState() => _TaskViewBodyState();
}

class _TaskViewBodyState extends State<TaskViewBody> {
  @override
  void initState() {
    BlocProvider.of<GetTasksCubit>(context).getTasks();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.symmetric(horizontal: 24),
      child: Column(
        children: [
          SizedBox(
            height: 70,
          ),
          CustomAppBar(
            icon: Icons.search,
            titleApp: 'Tasks',
          ),
          Expanded(
            child: CustomNoteListView(),
          ),
        ],
      ),
    );
  }
}
