import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:todotask/data/services/database_services.dart';
import 'package:todotask/feature/todo/model/todo_model.dart';

class TaskController extends GetxController {
  final FirestoreService firestoreService = FirestoreService();
  final titleController = TextEditingController();

  final descriptionController = TextEditingController();
  RxList<TaskModel> taskList = <TaskModel>[].obs;
  var dataModel = TaskModel().obs;
  var isUpdate = false.obs;

  @override
  void onInit() {
    super.onInit();

    firestoreService.getTasks().listen((tasks) {
      taskList.value = tasks;
    });
    // _getArguments();
  }

  @override
  void onReady() {
    super.onReady();
    _getArguments();
  }

  void _getArguments() {
    print("dddddddddddddddddddddddddddddddddddddddddd");
    if (Get.arguments != null) {
      print("dddddddddddddddddddddddddddddddddddddddddd1");
      isUpdate.value = Get.arguments["is_update"] ?? false;
      dataModel.value = Get.arguments["data"] ?? TaskModel();
    }
  }

  Future<void> addTask() async {
    await firestoreService.addTask(
      TaskModel(
        title: titleController.text,
        description: descriptionController.text,
      ),
    );
  }

  Future<void> deleteTask(String id) async {
    await firestoreService.deleteTask(id);
  }

  Future<void> updateTask(TaskModel task) async {
    await firestoreService.updateTask(task);
  }
}
