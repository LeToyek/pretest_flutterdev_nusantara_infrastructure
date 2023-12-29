import 'package:get/get.dart';
import 'package:pretest_flutterdev_nusantara_infrastructure/infrastructure/dal/daos/repository/book_repository_impl.dart';
import 'package:pretest_flutterdev_nusantara_infrastructure/infrastructure/navigation/bindings/domains/usecase/book_usecase.dart';

import '../../../../presentation/home/controllers/home.controller.dart';

class HomeControllerBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<BookRepositoryImpl>(
      () => BookRepositoryImpl(Get.find()),
    );
    Get.lazyPut<BookUseCase>(
      () => BookUseCase(Get.find<BookRepositoryImpl>()),
    );
    Get.lazyPut<HomeController>(
      () => HomeController(Get.find<BookUseCase>()),
    );
  }
}
