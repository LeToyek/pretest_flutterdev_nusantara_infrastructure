import 'package:get/get.dart';

import '../../../../presentation/book_form/controllers/book_form.controller.dart';

class BookFormControllerBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<BookFormController>(
      () => BookFormController(Get.find()),
    );
  }
}
