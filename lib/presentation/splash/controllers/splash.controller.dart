import 'package:get/get.dart';
import 'package:pretest_flutterdev_nusantara_infrastructure/presentation/auth/controllers/auth.controller.dart';

class SplashController extends GetxController {
  AuthController authController = AuthController.to;
  @override
  void onInit() {
    // TODO: implement onInit
    // print("SplashController");
    super.onInit();
    authController.checkLogin();
  }
}
