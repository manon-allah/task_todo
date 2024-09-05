import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:intl/intl.dart';
import 'package:todo_with_hive_cubit/logic/add_task/add_task_cubit.dart';
import 'package:todo_with_hive_cubit/model/todo_model.dart';
import 'package:todo_with_hive_cubit/view/widgets/custom_button_sheet.dart';
import 'package:todo_with_hive_cubit/view/widgets/custom_text_field.dart';

class AddTaskForm extends StatefulWidget {
  const AddTaskForm({super.key});

  @override
  State<AddTaskForm> createState() => _AddTaskFormState();
}

class _AddTaskFormState extends State<AddTaskForm> {
  final GlobalKey<FormState> formKey = GlobalKey();
  AutovalidateMode autovalidateMode = AutovalidateMode.disabled;

  String? task, date;
  @override
  Widget build(BuildContext context) {
    return Form(
      key: formKey,
      autovalidateMode: autovalidateMode,
      child: Column(
        children: [
          const SizedBox(
            height: 30,
          ),
          CustomTextField(
            textHint: 'Task',
            onSaved: (value) {
              task = value;
            },
          ),
          const SizedBox(
            height: 16,
          ),
          CustomTextField(
            textHint: 'Date',
            maxLine: 1,
            onSaved: (value) {
              date = value;
            },
          ),
          const SizedBox(
            height: 50,
          ),
          BlocBuilder<AddTaskCubit, AddTaskState>(
            builder: (context, state) {
              return CustomButtonSheet(
                isLoading: state is AddTaskLoading ? true : false,
                onTap: () {
                  if (formKey.currentState!.validate()) {
                    formKey.currentState!.save();
                    // var currentDate = DateTime.now();
                    // var formattedCurrentDate =
                    //     DateFormat('dd-mm-yyyy').format(currentDate);
                    var taskModel = TodoModel(
                      task: task!,
                      date: date!,
                      // date: formattedCurrentDate,
                    );
                    BlocProvider.of<AddTaskCubit>(context).addTask(taskModel);
                  } else {
                    autovalidateMode = AutovalidateMode.always;
                    setState(() {});
                  }
                },
              );
            },
          ),
          const SizedBox(
            height: 40,
          ),
        ],
      ),
    );
  }
}
