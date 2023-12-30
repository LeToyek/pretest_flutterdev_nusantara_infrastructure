import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pretest_flutterdev_nusantara_infrastructure/infrastructure/navigation/bindings/domains/entities/user.dart';
import 'package:pretest_flutterdev_nusantara_infrastructure/infrastructure/navigation/bindings/domains/usecase/auth_usecase.dart';
import 'package:pretest_flutterdev_nusantara_infrastructure/infrastructure/navigation/routes.dart';
import 'package:pretest_flutterdev_nusantara_infrastructure/presentation/components/basic_loader.dart';
import 'package:pretest_flutterdev_nusantara_infrastructure/presentation/components/snackbar/custom_snackbar.dart';

class AuthController extends GetxController {
  final AuthUseCase authUseCase;

  AuthController({required this.authUseCase});

  static AuthController get to => Get.find();

  final isLogin = true.obs;

  final user = Rxn<User>();

  final loginKey = GlobalKey<FormState>();
  final registerKey = GlobalKey<FormState>();

  final nameTextController = TextEditingController();
  final emailTextController = TextEditingController();
  final passwordTextController = TextEditingController();
  final passwordConfirmationTextController = TextEditingController();

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    nameTextController.dispose();
    emailTextController.dispose();
    passwordTextController.dispose();
    passwordConfirmationTextController.dispose();
  }

  void checkLogin() async {
    final res = authUseCase.checkLogin();
    if (res) {
      final data = await authUseCase.getUser();
      WidgetsBinding.instance.addPostFrameCallback((_) {
        user.value = data;
        Get.offNamed(Routes.HOME);
      });
    } else {
      WidgetsBinding.instance.addPostFrameCallback((_) {
        Get.offNamed(Routes.AUTH);
      });
    }
  }

  void switchScreen() {
    isLogin.value = !isLogin.value;
  }

  void login() async {
    if (loginKey.currentState!.validate()) {
      Get.dialog(const BasicLoader());
      try {
        final userLogin = UserCredential(
          email: emailTextController.text,
          password: passwordTextController.text,
        );
        final res = await authUseCase.login(userLogin);
        Get.back(closeOverlays: true);
        FocusManager.instance.primaryFocus?.unfocus();
        CustomSnackBar.showSuccess(
            title: "Login Berhasil", message: "Selamat datang ${res.name}");
        Get.offNamed(Routes.HOME);
      } catch (e) {
        Get.back(closeOverlays: true);
        CustomSnackBar.showError(title: "Error", message: e.toString());
      } finally {
        FocusManager.instance.primaryFocus?.unfocus();
      }
    }
  }

  void register() async {
    if (registerKey.currentState!.validate()) {
      Get.dialog(const BasicLoader());
      try {
        final userRegister = UserRegisterCredential(
          name: nameTextController.text,
          email: emailTextController.text,
          password: passwordTextController.text,
          passwordConfirmation: passwordConfirmationTextController.text,
        );
        final res = await authUseCase.register(userRegister);
        Get.back(closeOverlays: true);

        CustomSnackBar.showSuccess(
            title: "Register Berhasil", message: "Selamat datang ${res.name}");
      } catch (e) {
        Get.back(closeOverlays: true);
        CustomSnackBar.showError(title: "Error", message: e.toString());
      } finally {
        FocusManager.instance.primaryFocus?.unfocus();
      }
    }
  }

  void logout() async {
    Get.dialog(const BasicLoader());
    try {
      await authUseCase.logout();
      Get.back(closeOverlays: true);
      CustomSnackBar.showSuccess(title: "Logout Berhasil", message: "");
      Get.offAllNamed(Routes.AUTH);
    } catch (e) {
      Get.back(closeOverlays: true);
      CustomSnackBar.showError(title: "Error", message: e.toString());
    }
  }

  String? nameValidator(String? value) {
    if (value!.isEmpty) {
      return 'Nama tidak boleh kosong';
    }
    return null;
  }

  String? emailValidator(String? value) {
    if (value!.isEmpty) {
      return 'Email tidak boleh kosong';
    }
    if (!GetUtils.isEmail(value)) {
      return 'Email tidak valid';
    }
    return null;
  }

  String? passwordValidator(String? value) {
    if (value!.isEmpty) {
      return 'Password tidak boleh kosong';
    }
    return null;
  }

  String? passwordConfirmationValidator(String? value) {
    if (value!.isEmpty) {
      return 'Konfirmasi password tidak boleh kosong';
    }
    if (value != passwordTextController.text) {
      return 'Konfirmasi password tidak sama';
    }
    return null;
  }
}
