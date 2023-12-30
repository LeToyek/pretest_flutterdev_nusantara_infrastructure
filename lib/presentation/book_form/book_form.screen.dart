import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pretest_flutterdev_nusantara_infrastructure/presentation/components/text_field/custom_arise_text_field.dart';
import 'package:pretest_flutterdev_nusantara_infrastructure/presentation/components/text_field/custom_large_text_field.dart';

import 'controllers/book_form.controller.dart';

class BookFormScreen extends GetView<BookFormController> {
  const BookFormScreen({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          title: const Text('Tambah Buku'),
          centerTitle: true,
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
        floatingActionButton: _buildCustomFloatingActionButton(context),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Form(
                child: Column(
              children: [
                CustomAriseTextField(
                    controller: controller.titleController,
                    hint: "Judul Buku",
                    label: "Judul Buku"),
                CustomAriseTextField(
                    controller: controller.subTitleController,
                    hint: "Sub Judul Buku",
                    label: "Sub Judul Buku"),
                CustomAriseTextField(
                  label: "ISBN",
                  keyboardType: TextInputType.number,
                  controller: controller.isbnController,
                  hint: "ISBN",
                ),
                CustomAriseTextField(
                  label: "Jumlah Halaman",
                  keyboardType: TextInputType.number,
                  controller: controller.pagesController,
                  hint: "Jumlah Halaman",
                ),
                CustomAriseTextField(
                  controller: controller.authorController,
                  hint: "Penulis Buku",
                  label: "Penulis Buku",
                ),
                CustomAriseTextField(
                    controller: controller.publisherController,
                    hint: "Penerbit Buku",
                    label: "Penerbit Buku"),
                CustomLargeTextField(
                    controller: controller.descriptionController,
                    hint: "Deskripsi Buku",
                    label: "Deskripsi Buku"),
                CustomAriseTextField(
                    keyboardType: TextInputType.url,
                    controller: controller.websiteController,
                    hint: "Website Buku",
                    label: "Website Buku"),
                const SizedBox(
                  height: 64,
                )
              ],
            )),
          ),
        ));
  }

  Widget _buildCustomFloatingActionButton(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        GestureDetector(
            onTap: () {
              controller.addBook();
            },
            child: Container(
              padding: const EdgeInsets.symmetric(vertical: 16),
              margin: const EdgeInsets.symmetric(horizontal: 16),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: Theme.of(context).colorScheme.primary),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Icon(
                    Icons.add,
                    color: Colors.white,
                  ),
                  const SizedBox(
                    width: 8,
                  ),
                  Text(
                    "Tambah Buku",
                    style: Theme.of(context)
                        .textTheme
                        .bodyLarge!
                        .apply(fontWeightDelta: 2, color: Colors.white),
                  ),
                ],
              ),
            ))
      ],
    );
  }
}
