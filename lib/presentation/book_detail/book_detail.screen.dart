import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:url_launcher/url_launcher.dart';

import 'controllers/book_detail.controller.dart';

class BookDetailScreen extends GetView<BookDetailController> {
  const BookDetailScreen({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    return Obx(() => Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          foregroundColor: Colors.white,
          backgroundColor: Theme.of(context).colorScheme.primary,
          centerTitle: true,
          title: Text(
            controller.book.value!.title ?? "",
            style: textTheme.titleLarge!.apply(color: Colors.white),
          ),
        ),
        floatingActionButton: FloatingActionButton.extended(
            onPressed: controller.goToEditForm,
            icon: const Icon(Icons.edit),
            label: const Text("Edit Buku")),
        body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Table(
                columnWidths: const {
                  0: FlexColumnWidth(1),
                  1: FlexColumnWidth(0.1),
                  2: FlexColumnWidth(2),
                },
                children: [
                  _buildTableRow(context,
                      title: "ISBN", value: controller.book.value!.isbn ?? ""),
                  _buildTableRow(context,
                      title: "Sub Judul",
                      value: controller.book.value!.subtitle ?? ""),
                  _buildTableRow(context,
                      title: "Penulis",
                      value: controller.book.value!.author ?? ""),
                  _buildTableRow(context,
                      title: "Penerbit",
                      value: controller.book.value!.publisher ?? ""),
                  _buildTableRow(context,
                      title: "Tanggal Terbit",
                      value:
                          controller.book.value!.published!.substring(0, 10)),
                  _buildTableRow(context,
                      title: "Jumlah Halaman",
                      value: controller.book.value!.pages.toString()),
                  TableRow(children: [
                    Text(
                      "Website",
                      style: textTheme.bodyMedium,
                    ),
                    const Text(":"),
                    RichText(
                        text: TextSpan(
                            text: controller.book.value!.website ?? "",
                            style:
                                textTheme.bodyMedium!.apply(color: Colors.blue),
                            recognizer: TapGestureRecognizer()
                              ..onTap = () async {
                                final url = Uri.tryParse(
                                    controller.book.value!.website!);
                                if (url != null && await canLaunchUrl(url)) {
                                  await launchUrl(url);
                                } else {
                                  throw 'Could not launch $url';
                                }
                              }))
                  ]),
                ],
              ),
              const SizedBox(
                height: 8,
              ),
              const Divider(),
              Text(
                controller.book.value!.description ?? "",
                style: textTheme.bodyLarge,
              ),
            ],
          ),
        )));
  }

  TableRow _buildTableRow(context,
      {required String title, required String value}) {
    final textTheme = Theme.of(context).textTheme;
    return TableRow(children: [
      Text(
        title,
        style: textTheme.bodyMedium,
      ),
      const Text(":"),
      Text(
        value,
        style: textTheme.bodyMedium,
      ),
    ]);
  }
}
