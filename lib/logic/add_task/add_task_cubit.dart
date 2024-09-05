import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive/hive.dart';
import 'package:todo_with_hive_cubit/model/todo_model.dart';

part 'add_task_state.dart';

class AddTaskCubit extends Cubit<AddTaskState> {
  AddTaskCubit() : super(AddTaskInitial());

  addTask(TodoModel task) async {
    emit(AddTaskLoading());
    var taskBox = Hive.box<TodoModel>('Todo');
    await taskBox.add(task);
    emit(AddTaskSuccess());
    // print('note added');
  }
}
