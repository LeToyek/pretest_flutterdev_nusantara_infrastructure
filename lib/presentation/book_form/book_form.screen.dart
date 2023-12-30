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
          title: Text(controller.isEdit ? "Edit Buku" : "Tambah Buku"),
          centerTitle: true,
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
        floatingActionButton: _buildCustomFloatingActionButton(context),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Form(
                key: controller.bookFormKey,
                child: Column(
                  children: [
                    CustomAriseTextField(
                        controller: controller.titleController,
                        hint: "Judul Buku",
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return "Judul Buku tidak boleh kosong";
                          }
                          return null;
                        },
                        label: "Judul Buku"),
                    CustomAriseTextField(
                        controller: controller.subTitleController,
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return "Sub Judul Buku tidak boleh kosong";
                          }
                          return null;
                        },
                        hint: "Sub Judul Buku",
                        label: "Sub Judul Buku"),
                    CustomAriseTextField(
                      label: "ISBN",
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return "ISBN tidak boleh kosong";
                        }
                        return null;
                      },
                      keyboardType: TextInputType.number,
                      controller: controller.isbnController,
                      hint: "ISBN",
                    ),
                    CustomAriseTextField(
                      label: "Jumlah Halaman",
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return "Jumlah Halaman tidak boleh kosong";
                        }
                        return null;
                      },
                      keyboardType: TextInputType.number,
                      controller: controller.pagesController,
                      hint: "Jumlah Halaman",
                    ),
                    CustomAriseTextField(
                      controller: controller.authorController,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return "Penulis Buku tidak boleh kosong";
                        }
                        return null;
                      },
                      hint: "Penulis Buku",
                      label: "Penulis Buku",
                    ),
                    CustomAriseTextField(
                        controller: controller.publisherController,
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return "Penerbit Buku tidak boleh kosong";
                          }
                          return null;
                        },
                        hint: "Penerbit Buku",
                        label: "Penerbit Buku"),
                    CustomLargeTextField(
                        controller: controller.descriptionController,
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return "Deskripsi Buku tidak boleh kosong";
                          }
                          return null;
                        },
                        hint: "Deskripsi Buku",
                        label: "Deskripsi Buku"),
                    CustomAriseTextField(
                        keyboardType: TextInputType.url,
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return "Website Buku tidak boleh kosong";
                          }
                          return null;
                        },
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
            onTap: controller.onSubmit,
            child: Container(
              padding: const EdgeInsets.symmetric(vertical: 16),
              margin: const EdgeInsets.symmetric(horizontal: 16),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: Theme.of(context).colorScheme.primary),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    controller.isEdit ? Icons.save : Icons.add,
                    color: Colors.white,
                  ),
                  const SizedBox(
                    width: 8,
                  ),
                  Text(
                    controller.isEdit ? "Simpan Perubahan" : "Tambah Buku",
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
