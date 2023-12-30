import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pretest_flutterdev_nusantara_infrastructure/infrastructure/navigation/bindings/domains/usecase/book_usecase.dart';
import 'package:pretest_flutterdev_nusantara_infrastructure/presentation/components/basic_loader.dart';
import 'package:pretest_flutterdev_nusantara_infrastructure/presentation/components/dialog/custom_dialog.dart';
import 'package:pretest_flutterdev_nusantara_infrastructure/presentation/components/snackbar/custom_snackbar.dart';
import 'package:pretest_flutterdev_nusantara_infrastructure/presentation/home/controllers/home.controller.dart';

class BookFormController extends GetxController {
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

  late final addBookFormKey = GlobalKey<FormState>();
  late final editBookFormKey = GlobalKey<FormState>();

  @override
  void onInit() {
    titleController = TextEditingController();
    subTitleController = TextEditingController();
    authorController = TextEditingController();
    descriptionController = TextEditingController();
    publisherController = TextEditingController();
    websiteController = TextEditingController();
    isbnController = TextEditingController();
    pagesController = TextEditingController();
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
              message: "Buku ${res.title} berhasil ditambahkan");
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
