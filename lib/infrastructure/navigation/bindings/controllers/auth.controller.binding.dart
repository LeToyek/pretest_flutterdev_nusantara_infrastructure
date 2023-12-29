import 'package:get/get.dart';
import 'package:pretest_flutterdev_nusantara_infrastructure/infrastructure/dal/daos/repository/auth_repository_impl.dart';
import 'package:pretest_flutterdev_nusantara_infrastructure/infrastructure/navigation/bindings/domains/usecase/auth_usecase.dart';

import '../../../../presentation/auth/controllers/auth.controller.dart';

class AuthControllerBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<AuthController>(
      () => AuthController(
        authUseCase: Get.find(),
      ),
    );
    Get.lazyPut<AuthUseCase>(
      () => AuthUseCase(
        authRepository: Get.find<AuthRepositoryImpl>(),
      ),
    );
  }
}
