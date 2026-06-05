import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';
import 'package:todotask/feature/todo/model/todo_model.dart';
import 'package:todotask/feature/todo/screen/home_screen.dart';
import 'package:todotask/utils/popups/snack_bar_helpers.dart/snack_bar.dart';

class FirestoreService {
  final FirebaseFirestore firestore = FirebaseFirestore.instance;

  CollectionReference get taskCollection => firestore.collection("tasks");

  Future<void> addTask(TaskModel task) async {
    await taskCollection.add(task.toJson());
  }

  Future<void> updateTask(TaskModel task) async {
    final response =
        await taskCollection.doc(task.id).update(task.toJson()).then((Value) {
      USnackBarHelpers.successSnackBar(
          title: "Success", message: "Created Successfully");
      Get.toNamed(TaskScreen.routename);
    });
  }

  Future<void> deleteTask(String id) async {
    await taskCollection.doc(id).delete();
  }

  Stream<List<TaskModel>> getTasks() {
    return taskCollection.snapshots().map((snapshot) {
      return snapshot.docs.map((doc) {
        return TaskModel.fromJson(
          doc.data() as Map<String, dynamic>,
          doc.id,
        );
      }).toList();
    });
  }
}
