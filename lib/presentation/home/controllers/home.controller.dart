import 'package:get/get.dart';
import 'package:pretest_flutterdev_nusantara_infrastructure/infrastructure/navigation/bindings/domains/entities/book.dart';
import 'package:pretest_flutterdev_nusantara_infrastructure/infrastructure/navigation/bindings/domains/usecase/book_usecase.dart';
import 'package:pretest_flutterdev_nusantara_infrastructure/infrastructure/navigation/routes.dart';
import 'package:pretest_flutterdev_nusantara_infrastructure/presentation/auth/components/basic_loader.dart';
import 'package:pretest_flutterdev_nusantara_infrastructure/presentation/auth/controllers/auth.controller.dart';
import 'package:pretest_flutterdev_nusantara_infrastructure/presentation/components/snackbar/custom_snackbar.dart';

class HomeController extends GetxController with StateMixin<List<Book>> {
  BookUseCase bookUseCase;

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

  void goToBookDetail(int id) {
    Get.dialog(const BasicLoader());
    try {
      final book = state!.firstWhere((element) => element.id == id);
      Get.back(closeOverlays: true);
      Get.toNamed(Routes.BOOK_DETAIL, arguments: book);
    } catch (e) {
      Get.back(closeOverlays: true);
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
