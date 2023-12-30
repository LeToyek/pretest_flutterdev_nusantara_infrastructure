import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pretest_flutterdev_nusantara_infrastructure/presentation/auth/controllers/auth.controller.dart';
import 'package:pretest_flutterdev_nusantara_infrastructure/presentation/components/custom_button.dart';
import 'package:pretest_flutterdev_nusantara_infrastructure/presentation/components/text_field/custom_text_field.dart';

class LoginFormView extends GetView<AuthController> {
  const LoginFormView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Form(
        key: controller.loginKey,
        child: Column(
          children: [
            CustomTextField(
                validator: controller.emailValidator,
                controller: controller.emailTextController,
                hint: "Email",
                keyboardType: TextInputType.emailAddress,
                label: "Email"),
            const SizedBox(
              height: 24,
            ),
            CustomTextField(
                controller: controller.passwordTextController,
                validator: controller.passwordValidator,
                hint: "Password",
                isPassword: true,
                label: "Password"),
            const SizedBox(
              height: 24,
            ),
            CustomButton(onPressed: controller.login, label: "Login"),
            const SizedBox(
              height: 16,
            ),
            TextButton(
                onPressed: controller.switchScreen,
                child: const Text(
                  "Click here to register",
                  style: TextStyle(color: Colors.blueAccent),
                )),
          ],
        ));
  }
}
