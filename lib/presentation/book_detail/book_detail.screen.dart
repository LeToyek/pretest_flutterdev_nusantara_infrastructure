import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pretest_flutterdev_nusantara_infrastructure/presentation/components/custom_app_bar.dart';

import 'controllers/book_detail.controller.dart';

class BookDetailScreen extends GetView<BookDetailController> {
  const BookDetailScreen({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    return Obx(() => Scaffold(
        backgroundColor: Colors.white,
        appBar:
            buildCustomAppBar(context, title: controller.book.value!.title!),
        body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Table(
                columnWidths: const {
                  0: FlexColumnWidth(1),
                  1: FlexColumnWidth(2),
                },
                children: [
                  TableRow(children: [
                    Text(
                      "Title",
                      style: textTheme.bodyMedium,
                    ),
                    Text(
                      ": ${controller.book.value!.title ?? ""}",
                      style: textTheme.bodyMedium,
                    ),
                  ]),
                  TableRow(children: [
                    Text(
                      "Author",
                      style: textTheme.bodyMedium,
                    ),
                    Text(
                      ": ${controller.book.value!.author ?? ""}",
                      style: textTheme.bodyMedium,
                    ),
                  ]),
                  TableRow(children: [
                    Text(
                      "Publisher",
                      style: textTheme.bodyMedium,
                    ),
                    Text(
                      ": ${controller.book.value!.publisher ?? ""}",
                      style: textTheme.bodyMedium,
                    ),
                  ]),
                  TableRow(children: [
                    Text(
                      "Published Date",
                      style: textTheme.bodyMedium,
                    ),
                    Text(
                      ": ${controller.book.value!.published!.substring(0, 10)}",
                      style: textTheme.bodyMedium,
                    ),
                  ]),
                ],
              ),
              const SizedBox(
                height: 8,
              ),
              Text(
                controller.book.value!.description ?? "",
                style: textTheme.bodyLarge,
              ),
            ],
          ),
        )));
  }
}
