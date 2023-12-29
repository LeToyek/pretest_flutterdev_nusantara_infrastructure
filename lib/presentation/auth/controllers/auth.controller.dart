import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pretest_flutterdev_nusantara_infrastructure/infrastructure/dal/services/cache_manager.dart';
import 'package:pretest_flutterdev_nusantara_infrastructure/infrastructure/navigation/bindings/domains/entities/user.dart';
import 'package:pretest_flutterdev_nusantara_infrastructure/infrastructure/navigation/bindings/domains/usecase/auth_usecase.dart';

class AuthController extends GetxController {
  final AuthUseCase authUseCase;
  final store = Get.find<CacheManager>();

  AuthController({required this.authUseCase});

  final isLogged = false.obs;

  final emailTextController = TextEditingController();
  final passwordTextController = TextEditingController();

  void login() async {
    isLogged.value = true;
    final userLogin = UserCredential(
      email: emailTextController.text,
      password: passwordTextController.text,
    );
    final res = await authUseCase.login(userLogin);
    store.saveUser(res);
  }

  void register() async {
    isLogged.value = true;
    final userRegister = UserRegisterCredential(
      name: emailTextController.text,
      email: emailTextController.text,
      password: passwordTextController.text,
      passwordConfirmation: passwordTextController.text,
    );
    final res = await authUseCase.register(userRegister);
    store.saveUser(res);
  }

  void logout() async {
    isLogged.value = false;
    store.saveUser(null);
    await authUseCase.logout();
  }
}
