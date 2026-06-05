import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:todotask/feature/auth/controller/login_controller.dart';
import 'package:todotask/feature/auth/screens/widget/login_form.dart';
import 'package:todotask/feature/auth/screens/widget/login_header.dart';
import 'package:todotask/utils/contsants/sizes.dart';

class LoginScreen extends StatelessWidget {
  LoginScreen({super.key});

  final AuthController controller = Get.put(AuthController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(USizes.defaultSpace),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                ULoginHeader(),
                SizedBox(
                  height: USizes.spaceBtwSections,
                ), //formsection
                ULoginForm(),

                SizedBox(
                  height: USizes.spaceBtwSections,
                ),
              ],
            ),
          ),
        ));
  }
}
