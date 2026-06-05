import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:todotask/feature/todo/controller/todo_controller.dart';
import 'package:todotask/feature/todo/screen/add_screen.dart';

class TaskScreen extends StatelessWidget {
  TaskScreen({super.key});
  static const routename = "/taskscreen";
  final TaskController controller = Get.put(TaskController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Todo App"),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Get.toNamed(AddTaskScreen.routeName);
        },
        child: const Icon(Icons.add),
      ),
      body: Obx(() {
        return ListView.builder(
          itemCount: controller.taskList.length,
          itemBuilder: (context, index) {
            final task = controller.taskList[index];

            return ListTile(
              title: Text(task.title ?? ""),
              onTap: () {
                Get.to(
                  () => AddTaskScreen(),
                  arguments: {
                    "is_update": true,
                    "data": task,
                  },
                );
                ;
              },
              subtitle: Text(task.description ?? ""),
              trailing: IconButton(
                icon: const Icon(
                  Icons.delete,
                  color: Colors.red,
                ),
                onPressed: () {
                  confirmDelete(task.id!);
                },
              ),
            );
          },
        );
      }),
    );
  }

  void confirmDelete(String taskId) {
    Get.defaultDialog(
      title: "Delete Task",
      middleText: "Are you sure you want to delete this task?",
      textCancel: "Cancel",
      textConfirm: "Delete",
      confirmTextColor: Colors.white,
      onConfirm: () async {
        Get.back();
        await controller.deleteTask(taskId);
        // close dialog
      },
      onCancel: () {
        Get.back(); // just close dialog
      },
    );
  }
}
