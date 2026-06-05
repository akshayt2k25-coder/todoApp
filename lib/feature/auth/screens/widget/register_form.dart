import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:todotask/common/button/elevated_button.dart';
import 'package:todotask/feature/auth/controller/login_controller.dart';
import 'package:todotask/feature/auth/controller/register_controller.dart';
import 'package:todotask/utils/contsants/sizes.dart';
import 'package:todotask/utils/validators/validator.dart';

class URegisterForm extends StatelessWidget {
  const URegisterForm({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final controller = RegisterController.instance;
    ;
    return Form(
      key: controller.key,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          TextFormField(
            controller: controller.emailController,
            validator: (value) => UValidator.validateEmail(value),
            decoration: InputDecoration(
                prefixIcon: Icon(Iconsax.direct_right), labelText: "Email"),
          ),
          SizedBox(
            height: USizes.spaceBtwInputFields,
          ), //
          Obx(
            () => TextFormField(
              controller: controller.passwordController,
              obscureText: controller.isPasswordVisible.value,
              validator: (value) =>
                  UValidator.validateEmptyText("Password", value),
              decoration: InputDecoration(
                  prefixIcon: Icon(Iconsax.direct_right),
                  labelText: "Password",
                  suffixIcon: IconButton(
                      onPressed: () => controller.isPasswordVisible.toggle(),
                      icon: Icon(controller.isPasswordVisible.value
                          ? Iconsax.eye
                          : Iconsax.eye_slash))),
            ),
          ),
          SizedBox(
            height: USizes.spaceBtwInputFields / 2,
          ),

          SizedBox(
            height: USizes.spaceBtwSections,
          ), //
          UElevatedButton(child: Text("Sign UP"), onPress: controller.register),
          SizedBox(
            height: USizes.spaceBtwItems / 2,
          ), //

          //checkboxandforgotpasswordsection
        ],
      ),
    );
  }
}
