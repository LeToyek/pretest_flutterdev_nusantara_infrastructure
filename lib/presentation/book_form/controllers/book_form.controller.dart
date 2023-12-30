import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pretest_flutterdev_nusantara_infrastructure/infrastructure/navigation/bindings/domains/entities/book.dart';
import 'package:pretest_flutterdev_nusantara_infrastructure/infrastructure/navigation/bindings/domains/usecase/book_usecase.dart';
import 'package:pretest_flutterdev_nusantara_infrastructure/presentation/components/basic_loader.dart';
import 'package:pretest_flutterdev_nusantara_infrastructure/presentation/components/dialog/custom_dialog.dart';
import 'package:pretest_flutterdev_nusantara_infrastructure/presentation/components/snackbar/custom_snackbar.dart';
import 'package:pretest_flutterdev_nusantara_infrastructure/presentation/home/controllers/home.controller.dart';

class BookFormController extends GetxController {
  dynamic argumentData = Get.arguments;

  final bookArgs = Rxn<Book>();

  BookUseCase bookUseCase;

  HomeController homeController = HomeController.to;

  BookFormController(this.bookUseCase);

  late TextEditingController titleController;
  late TextEditingController subTitleController;
  late TextEditingController authorController;
  late TextEditingController descriptionController;
  late TextEditingController publisherController;
  late TextEditingController websiteController;
  late TextEditingController isbnController;
  late TextEditingController pagesController;

  late final bookFormKey = GlobalKey<FormState>();

  @override
  void onInit() {
    if (argumentData != null) {
      bookArgs.value = argumentData;
    }
    titleController = TextEditingController(
      text: bookArgs.value?.title ?? "",
    );
    subTitleController = TextEditingController(
      text: bookArgs.value?.subtitle ?? "",
    );
    authorController = TextEditingController(
      text: bookArgs.value?.author ?? "",
    );
    descriptionController = TextEditingController(
      text: bookArgs.value?.description ?? "",
    );
    publisherController = TextEditingController(
      text: bookArgs.value?.publisher ?? "",
    );
    websiteController = TextEditingController(
      text: bookArgs.value?.website ?? "",
    );
    isbnController = TextEditingController(
      text: bookArgs.value?.isbn ?? "",
    );
    pagesController = TextEditingController(
      text: bookArgs.value?.pages.toString() ?? "",
    );

    super.onInit();
  }

  @override
  void onClose() {
    titleController.dispose();
    subTitleController.dispose();
    authorController.dispose();
    descriptionController.dispose();
    publisherController.dispose();
    websiteController.dispose();
    isbnController.dispose();
    pagesController.dispose();
    super.onClose();
  }

  bool get isEdit => argumentData != null;

  void onSubmit() {
    if (bookFormKey.currentState!.validate()) {
      if (isEdit) {
        editBook();
      } else {
        addBook();
      }
    }
  }

  void editBook() {
    Get.dialog(CustomDialogWidget(
      description: "Apakah anda yakin ingin mengubah buku ini?",
      onConfirm: () async {
        Get.dialog(const BasicLoader());
        try {
          final now = DateTime.now();
          final res = await bookUseCase.updateBook(
            id: bookArgs.value?.id ?? 0,
            isbn: isbnController.text,
            title: titleController.text,
            subtitle: subTitleController.text,
            author: authorController.text,
            published: now,
            publisher: publisherController.text,
            pages: int.parse(pagesController.text),
            description: descriptionController.text,
            website: websiteController.text,
          );
          final newBook =
              await bookUseCase.getBookById(bookArgs.value?.id ?? 0);

          Get.back(closeOverlays: true, result: newBook);
          CustomSnackBar.showSuccess(
              title: "Berhasil Mengubah Buku", message: "Buku berhasil diubah");
        } catch (e) {
          Get.back(closeOverlays: true);
          CustomSnackBar.showError(title: "Error", message: e.toString());
        } finally {
          homeController.getAllBooks();
          // Get.back();
        }
      },
    ));
  }

  void addBook() {
    Get.dialog(CustomDialogWidget(
      description: "Apakah anda yakin ingin menambahkan buku ini?",
      onConfirm: () async {
        Get.dialog(const BasicLoader());
        try {
          final now = DateTime.now();
          final res = await bookUseCase.addBook(
            isbn: isbnController.text,
            title: titleController.text,
            subtitle: subTitleController.text,
            author: authorController.text,
            published: now,
            publisher: publisherController.text,
            pages: int.parse(pagesController.text),
            description: descriptionController.text,
            website: websiteController.text,
          );
          Get.back(closeOverlays: true);
          CustomSnackBar.showSuccess(
              title: "Berhasil Menambahkan Buku",
              message: "Buku berhasil ditambahkan");
        } catch (e) {
          Get.back();
          CustomSnackBar.showError(title: "Error", message: e.toString());
        } finally {
          homeController.getAllBooks();
          // Get.back();
        }
      },
    ));
  }
}
