import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo_with_hive_cubit/logic/get_tasks/get_tasks_cubit.dart';
import 'package:todo_with_hive_cubit/model/todo_model.dart';
import 'package:todo_with_hive_cubit/view/note_edit_view.dart';

class TaskItems extends StatelessWidget {
  const TaskItems({super.key, required this.task});

  final TodoModel task;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(context, MaterialPageRoute(builder: (context) {
          return TaskEditView(
            task: task,
          );
        }));
      },
      child: Container(
        decoration: BoxDecoration(
          color: Colors.cyanAccent,
          borderRadius: BorderRadius.circular(16),
        ),
        child: Padding(
          padding: const EdgeInsets.only(left: 16, top: 15, bottom: 16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              ListTile(
                title: Text(
                  task.task,
                  style: const TextStyle(
                    color: Colors.black,
                    fontSize: 25,
                  ),
                ),
                subtitle: Padding(
                  padding: const EdgeInsets.only(top: 16, bottom: 16),
                  child: Text(
                    task.date,
                    style: TextStyle(
                      color: Colors.black.withOpacity(0.5),
                      fontSize: 18,
                    ),
                  ),
                ),
                trailing: IconButton(
                  onPressed: () {
                    task.delete();
                    BlocProvider.of<GetTasksCubit>(context).getTasks();
                  },
                  icon: const Icon(
                    Icons.delete,
                    size: 32,
                    color: Colors.black,
                  ),
                ),
              ),
              // Padding(
              //   padding: const EdgeInsets.only(right: 37, bottom: 10),
              //   child: Text(task.date,
              //       style: TextStyle(
              //         color: Colors.black.withOpacity(0.5),
              //         fontSize: 18,
              //       )),
              // )
            ],
          ),
        ),
      ),
    );
  }
}
