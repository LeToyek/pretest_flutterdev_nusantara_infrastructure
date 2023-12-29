import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pretest_flutterdev_nusantara_infrastructure/presentation/auth/views/login_form_view.dart';
import 'package:pretest_flutterdev_nusantara_infrastructure/presentation/auth/views/register_form_view.dart';

import 'controllers/auth.controller.dart';

class AuthScreen extends GetView<AuthController> {
  const AuthScreen({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(body: LayoutBuilder(builder: (context, constraints) {
      return SingleChildScrollView(
          child: ConstrainedBox(
        constraints: BoxConstraints(
            minHeight: constraints.maxHeight, minWidth: constraints.maxWidth),
        child: IntrinsicHeight(
          child: Center(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset(
                    "assets/images/ni_logo.png",
                    height: 200,
                  ),
                  const SizedBox(
                    height: 24,
                  ),
                  Obx(() => controller.isLogin.value
                      ? const LoginFormView()
                      : const RegisterFormView()),
                ],
              ),
            ),
          ),
        ),
      ));
    }));
  }
}
