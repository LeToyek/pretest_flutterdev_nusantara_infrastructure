import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'controllers/home.controller.dart';

class HomeScreen extends GetView<HomeController> {
  const HomeScreen({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('HomeScreen'),
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const Text(
              'HomeScreen is working',
              style: TextStyle(fontSize: 20),
            ),
            Obx(
              () => Text(
                "${controller.count}",
              ),
            ),
            ElevatedButton(
                onPressed: () {
                  controller.increment();
                },
                child: const Text("Push it")),
            const SizedBox(
              height: 24,
            ),
          ],
        ),
      ),
    );
  }
}
