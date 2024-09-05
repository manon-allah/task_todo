import 'package:bloc/bloc.dart';
import 'package:hive/hive.dart';
import 'package:meta/meta.dart';

import 'package:todo_with_hive_cubit/model/todo_model.dart';

part 'get_tasks_state.dart';

class GetTasksCubit extends Cubit<GetTasksState> {
  GetTasksCubit() : super(GetTasksInitial());

  List<TodoModel>? tasks;
  getTasks() {
    var taskBox = Hive.box<TodoModel>('Todo');
    tasks = taskBox.values.toList();
    emit(GetTasksSuccess());
    // print('note geted');
  }
}
