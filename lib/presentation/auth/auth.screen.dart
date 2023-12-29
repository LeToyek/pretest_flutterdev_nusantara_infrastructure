import 'package:flutter/material.dart';
import 'package:get/get.dart';

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
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text(
                  'AuthScreen is working',
                  style: TextStyle(fontSize: 20),
                ),
                Obx(
                  () => Text(
                    "${controller.isLogged}",
                  ),
                ),
                ElevatedButton(
                    onPressed: controller.login, child: const Text("Login")),
                ElevatedButton(
                    onPressed: () {
                      controller.logout();
                    },
                    child: const Text("Logout")),
                const SizedBox(
                  height: 24,
                ),
              ],
            ),
          ),
        ),
      ));
    }));
  }
}
