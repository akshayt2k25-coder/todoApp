import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:todotask/data/services/database_services.dart';
import 'package:todotask/feature/todo/model/todo_model.dart';
import 'package:todotask/feature/todo/screen/home_screen.dart';
import 'package:todotask/utils/popups/snack_bar_helpers.dart/snack_bar.dart';

class AddUpdateController extends GetxController {
  final FirestoreService firestoreService = FirestoreService();
  final titleController = TextEditingController();

  final descriptionController = TextEditingController();
  RxList<TaskModel> taskList = <TaskModel>[].obs;
  var dataModel = TaskModel().obs;
  var isUpdate = false.obs;
  final formKey = GlobalKey<FormState>();
  // @override
  // void onInit() {
  //   super.onInit();

  //   _getArguments();
  // }

  @override
  void onReady() {
    super.onReady();
    _getArguments();
  }

  @override
  void dispose() {
    titleController.clear();
    descriptionController.clear();
    // TODO: implement dispose
    super.dispose();
  }

  void _getArguments() {
    print("dddddddddddddddddddddddddddddddddddddddddd");
    if (Get.arguments != null) {
      print("dddddddddddddddddddddddddddddddddddddddddd1");
      isUpdate.value = Get.arguments["is_update"] ?? false;
      dataModel.value = Get.arguments["data"] ?? TaskModel();
      descriptionController.text = dataModel.value.description ?? "";
      titleController.text = dataModel.value.title ?? "";
    }
  }

  Future<void> addTask() async {
    print("callinggggggg");

    await firestoreService.addTask(
      TaskModel(
        title: titleController.text,
        description: descriptionController.text,
      ),
    );

    // USnackBarHelpers.successSnackBar(
    //   title: "Success",
    //   message: "Created Successfully",
    // );

    Get.offAll(() => TaskScreen());
  }

  Future<void> updateTask(TaskModel task) async {
    await firestoreService.updateTask(task);
    USnackBarHelpers.successSnackBar(
        title: "Success", message: "Created Successfully");
    //  /
  }
}
