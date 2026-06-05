import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:todotask/feature/auth/screens/login_screen.dart';
import 'package:todotask/utils/popups/snack_bar_helpers.dart/snack_bar.dart';

class RegisterController extends GetxController {
  static RegisterController get instance => Get.find();
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final RxBool isPasswordVisible = false.obs;
  RxBool loading = false.obs;
  var key = GlobalKey<FormState>();
  Future<void> register() async {
    try {
      loading.value = true;

      var response = await _auth.createUserWithEmailAndPassword(
        email: emailController.text.trim(),
        password: passwordController.text.trim(),
      );
      USnackBarHelpers.successSnackBar(
          title: "Error", message: "Successfully Register");
      Get.offAll(LoginScreen());
    } on FirebaseAuthException catch (e) {
      USnackBarHelpers.errorSnackBar(title: "Success", message: e.toString());
    } finally {
      loading.value = false;
    }
  }

  Future<void> logout() async {
    await _auth.signOut();

    Get.offAllNamed('/login');
  }
}
