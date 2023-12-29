import 'package:get/get.dart';
import 'package:pretest_flutterdev_nusantara_infrastructure/infrastructure/dal/daos/repository/auth_repository_impl.dart';
import 'package:pretest_flutterdev_nusantara_infrastructure/infrastructure/dal/services/nusantara_api_client.dart';
import 'package:pretest_flutterdev_nusantara_infrastructure/infrastructure/navigation/bindings/domains/usecase/auth_usecase.dart';
import 'package:pretest_flutterdev_nusantara_infrastructure/presentation/auth/controllers/auth.controller.dart';

class AuthControllerBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => AuthRepositoryImpl(Get.find<NusantaraApiClient>()));
    Get.lazyPut<AuthUseCase>(
      () => AuthUseCase(
        authRepository: Get.find<AuthRepositoryImpl>(),
      ),
    );
    Get.put<AuthController>(
        AuthController(authUseCase: Get.find<AuthUseCase>()),
        permanent: true);
  }
}
