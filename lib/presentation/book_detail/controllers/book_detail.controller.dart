import 'package:get/get.dart';
import 'package:pretest_flutterdev_nusantara_infrastructure/infrastructure/navigation/bindings/domains/entities/book.dart';
import 'package:pretest_flutterdev_nusantara_infrastructure/infrastructure/navigation/routes.dart';

class BookDetailController extends GetxController {
  dynamic argumentData = Get.arguments;

  final book = Rxn<Book>();

  @override
  void onInit() {
    super.onInit();
    book.value = argumentData;
    print("BookDetailController onInit ${book.value!.title}");
  }

  void goToEditForm() async {
    final res = await Get.toNamed(Routes.BOOK_FORM, arguments: book.value);
    if (res != null) {
      book.value = res;
    }
  }
}
