import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pretest_flutterdev_nusantara_infrastructure/presentation/auth/components/auth_button.dart';
import 'package:pretest_flutterdev_nusantara_infrastructure/presentation/auth/components/auth_text_field.dart';
import 'package:pretest_flutterdev_nusantara_infrastructure/presentation/auth/controllers/auth.controller.dart';

class LoginFormView extends GetView<AuthController> {
  const LoginFormView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Form(
        key: controller.loginKey,
        child: Column(
          children: [
            AuthTextField(
                validator: controller.emailValidator,
                controller: controller.emailTextController,
                hint: "Email",
                keyboardType: TextInputType.emailAddress,
                label: "Email"),
            const SizedBox(
              height: 24,
            ),
            AuthTextField(
                controller: controller.passwordTextController,
                validator: controller.passwordValidator,
                hint: "Password",
                isPassword: true,
                label: "Password"),
            const SizedBox(
              height: 24,
            ),
            AuthButton(onPressed: controller.login, label: "Login"),
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
