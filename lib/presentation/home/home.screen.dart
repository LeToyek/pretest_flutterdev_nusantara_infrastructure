import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pretest_flutterdev_nusantara_infrastructure/presentation/components/custom_app_bar.dart';
import 'package:pretest_flutterdev_nusantara_infrastructure/presentation/home/views/book_card_view.dart';

import 'controllers/home.controller.dart';

class HomeScreen extends GetView<HomeController> {
  const HomeScreen({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: const CustomAppBar(),
        backgroundColor: Colors.white,
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            // controller.increment();
          },
          child: const Icon(Icons.add),
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              children: [
                controller.obx(
                  (state) => ListView.builder(
                      shrinkWrap: true,
                      itemBuilder: (context, index) {
                        final item = state[index];
                        return BookCardView(book: item);
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
        ),
      ),
    );
  }
}
