import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pretest_flutterdev_nusantara_infrastructure/infrastructure/navigation/bindings/domains/entities/book.dart';
import 'package:pretest_flutterdev_nusantara_infrastructure/infrastructure/navigation/bindings/domains/usecase/book_usecase.dart';
import 'package:pretest_flutterdev_nusantara_infrastructure/infrastructure/navigation/routes.dart';
import 'package:pretest_flutterdev_nusantara_infrastructure/presentation/auth/components/basic_loader.dart';
import 'package:pretest_flutterdev_nusantara_infrastructure/presentation/auth/controllers/auth.controller.dart';
import 'package:pretest_flutterdev_nusantara_infrastructure/presentation/components/snackbar/custom_snackbar.dart';

class HomeController extends GetxController with StateMixin<List<Book>> {
  BookUseCase bookUseCase;

  final deleteListId = <int>[].obs;

  final authController = AuthController.to;

  HomeController(this.bookUseCase);

  static HomeController get to => Get.find();

  void getAllBooks() async {
    change(null, status: RxStatus.loading());
    try {
      final books = await bookUseCase.getBooks();
      print(books);
      change(books, status: RxStatus.success());
    } catch (e) {
      change(null, status: RxStatus.error(e.toString()));
    }
  }

  void addItemToDelete(int id) {
    if (deleteListId.contains(id)) {
      deleteListId.remove(id);
    } else {
      deleteListId.add(id);
    }
  }

  bool isSelectedCard(int id) {
    if (deleteListId.contains(id)) {
      return true;
    } else {
      return false;
    }
  }

  void deleteSelectedBook() {
    Get.dialog(AlertDialog(
      title: const Text("Konfirmasi"),
      content: const Text(
          "Apakah anda yakin ingin menghapus semua buku yang anda pilih?"),
      actions: [
        TextButton(
          onPressed: () {
            Get.back();
          },
          child: const Text("Batal"),
        ),
        TextButton(
          onPressed: () async {
            Get.dialog(const BasicLoader());
            try {
              await Future.wait(
                  deleteListId.map((e) => bookUseCase.deleteBook(e)));
              deleteListId.clear();
              Get.back(closeOverlays: true);
              CustomSnackBar.showSuccess(
                  title: "Success", message: "Berhasil dihapus");
              getAllBooks();
            } catch (e) {
              Get.back(closeOverlays: true);
              CustomSnackBar.showError(title: "Error", message: e.toString());
            }
            Get.back();
          },
          child: const Text("Hapus"),
        ),
      ],
    ));
  }

  void goToBookDetail(int id) {
    try {
      if (deleteListId.contains(id)) {
        deleteListId.remove(id);
        return;
      }
      final book = state!.firstWhere((element) => element.id == id);
      Get.toNamed(Routes.BOOK_DETAIL, arguments: book);
    } catch (e) {
      CustomSnackBar.showError(title: "Error", message: e.toString());
    }
  }

  Future<void> logout() async {
    authController.logout();
  }

  @override
  void onInit() {
    getAllBooks();
    super.onInit();
  }
}
