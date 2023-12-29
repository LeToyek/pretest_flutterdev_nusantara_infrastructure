import 'package:get/get.dart';
import 'package:pretest_flutterdev_nusantara_infrastructure/infrastructure/navigation/bindings/domains/entities/book.dart';

class BookDetailController extends GetxController {
  dynamic argumentData = Get.arguments;

  final book = Rxn<Book>();

  @override
  void onInit() {
    super.onInit();
    book.value = argumentData;
  }
}
