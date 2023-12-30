import 'package:get/get.dart';
import 'package:pretest_flutterdev_nusantara_infrastructure/infrastructure/dal/daos/models/user/user_request.dart';
import 'package:pretest_flutterdev_nusantara_infrastructure/infrastructure/dal/services/cache_manager.dart';
import 'package:pretest_flutterdev_nusantara_infrastructure/infrastructure/navigation/bindings/domains/entities/user.dart';
import 'package:pretest_flutterdev_nusantara_infrastructure/infrastructure/navigation/bindings/domains/repository/auth_repository.dart';

class AuthUseCase {
  final AuthRepository authRepository;

  final store = Get.find<CacheManager>();

  AuthUseCase({required this.authRepository});

  bool checkLogin() {
    try {
      final token = store.getToken();
      if (token == null) {
        return false;
      }
      if (token.isEmpty) {
        return false;
      }
      return true;
    } catch (e) {
      rethrow;
    }
  }

  Future<User?> getUser() async {
    try {
      final data = await authRepository.getUser();
      final userEntity = User.fromData(data);
      return userEntity;
    } catch (e) {
      rethrow;
    }
  }

  Future<User> login(UserCredential params) async {
    try {
      final param = UserLoginRequest(
        email: params.email,
        password: params.password,
      );
      final res = await authRepository.signInWithEmailAndPassword(param);
      final token = res.token ?? "";
      await store.saveToken(token);
      final data = await authRepository.getUser();
      final userEntity = User.fromData(data);
      return userEntity;
    } catch (e) {
      rethrow;
    }
  }

  Future<User> register(UserRegisterCredential params) async {
    try {
      final param = UserRegisterRequest(
        name: params.name,
        email: params.email,
        password: params.password,
        passwordConfirmation: params.passwordConfirmation,
      );
      await authRepository.signUp(param);
      final userEntity = await login(UserCredential(
        email: params.email,
        password: params.password,
      ));
      return userEntity;
    } catch (e) {
      rethrow;
    }
  }

  Future<void> logout() async {
    try {
      await authRepository.signOut();
      await store.clear();
    } catch (e) {
      rethrow;
    }
  }
}
