import 'package:get/get.dart';

import '../../../../presentation/book_detail/controllers/book_detail.controller.dart';

class BookDetailControllerBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<BookDetailController>(
      () => BookDetailController(),
    );
  }
}
