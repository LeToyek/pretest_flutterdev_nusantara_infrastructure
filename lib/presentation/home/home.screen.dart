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
            ElevatedButton(
                onPressed: controller.authController.logout,
                child: const Text("Logout")),
            const Text(
              'HomeScreen is working',
              style: TextStyle(fontSize: 20),
            ),
            controller.obx(
              (state) => ListView.builder(
                  shrinkWrap: true,
                  itemBuilder: (context, index) {
                    final item = state[index];
                    return ListTile(
                      title: Text(item.title ?? "No Title"),
                    );
                  },
                  itemCount: state!.length),
              onError: (error) => Center(
                child: Text("Error $error"),
              ),
              onEmpty: const Center(
                child: Text("No Data"),
              ),
              onLoading: const Center(
                child: CircularProgressIndicator(),
              ),
            ),
            // Obx(
            //   () => Text(
            //     "${controller.count}",
            //   ),
            // ),
            // ElevatedButton(
            //     onPressed: () {
            //       controller.increment();
            //     },
            //     child: const Text("Push it")),
            const SizedBox(
              height: 24,
            ),
          ],
        ),
      ),
    );
  }
}
