import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:todotask/common/button/elevated_button.dart';
import 'package:todotask/common/textfields/text_field.dart';
import 'package:todotask/feature/todo/controller/add_update_controller.dart';

import 'package:todotask/feature/todo/model/todo_model.dart';
import 'package:todotask/utils/contsants/sizes.dart';

class AddTaskScreen extends StatelessWidget {
  AddTaskScreen({super.key});
  static const routeName = "/addScreen";
  final taskController = Get.put(AddUpdateController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Obx(() {
          return Text(
              taskController.isUpdate.value ? "Update Task" : "Add Task");
        }),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Form(
          key: taskController.formKey,
          child: Column(
            children: [
              NewInputCard(
                controller: taskController.titleController,
                title: "Task",
                label: "Enter Task",
                showValidator: true,
              ),
              SizedBox(
                height: USizes.spaceBtwInputFields,
              ),
              NewInputCard(
                controller: taskController.descriptionController,
                title: "Description",
                label: "Enter Description",
                showValidator: true,
              ),
              SizedBox(
                height: USizes.spaceBtwItems,
              ),
              Obx(() {
                return UElevatedButton(
                  onPress: () async {
                    if (taskController.formKey.currentState!.validate()) {
                      taskController.isUpdate.value
                          ? await taskController.updateTask(TaskModel(
                              id: taskController.dataModel.value.id,
                              title: taskController.titleController.text,
                              description:
                                  taskController.descriptionController.text))
                          : await taskController.addTask();
                    }
                  },
                  child:
                      Text(taskController.isUpdate.value ? "Update" : "Save"),
                );
              }),
            ],
          ),
        ),
      ),
    );
  }
}
