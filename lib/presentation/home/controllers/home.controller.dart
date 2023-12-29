import 'package:get/get.dart';
import 'package:pretest_flutterdev_nusantara_infrastructure/infrastructure/navigation/bindings/domains/entities/book.dart';
import 'package:pretest_flutterdev_nusantara_infrastructure/infrastructure/navigation/bindings/domains/usecase/book_usecase.dart';
import 'package:pretest_flutterdev_nusantara_infrastructure/presentation/auth/controllers/auth.controller.dart';

class HomeController extends GetxController with StateMixin<List<Book>> {
  BookUseCase bookUseCase;

  final authController = AuthController.to;

  HomeController(this.bookUseCase);

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

  Future<void> logout() async {
    authController.logout();
  }

  @override
  void onInit() {
    getAllBooks();
    super.onInit();
  }
}
