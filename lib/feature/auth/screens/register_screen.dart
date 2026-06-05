import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:todotask/feature/auth/controller/register_controller.dart';

import 'package:todotask/feature/auth/screens/widget/login_header.dart';
import 'package:todotask/feature/auth/screens/widget/register_form.dart';
import 'package:todotask/utils/contsants/sizes.dart';

class RegisterScreen extends StatelessWidget {
  RegisterScreen({super.key});

  final RegisterController controller = Get.put(RegisterController());

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
                ULoginHeader(
                  isregister: true,
                ),
                SizedBox(
                  height: USizes.spaceBtwSections,
                ), //formsection
                URegisterForm(),

                SizedBox(
                  height: USizes.spaceBtwSections,
                ),
              ],
            ),
          ),
        ));
  }
}
