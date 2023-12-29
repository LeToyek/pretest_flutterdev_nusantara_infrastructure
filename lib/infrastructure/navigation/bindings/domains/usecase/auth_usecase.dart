import 'package:pretest_flutterdev_nusantara_infrastructure/infrastructure/dal/daos/models/user_request.dart';
import 'package:pretest_flutterdev_nusantara_infrastructure/infrastructure/navigation/bindings/domains/entities/user.dart';
import 'package:pretest_flutterdev_nusantara_infrastructure/infrastructure/navigation/bindings/domains/repository/auth_repository.dart';

class AuthUseCase {
  final AuthRepository authRepository;

  AuthUseCase({required this.authRepository});

  Future<User> login(UserCredential params) async {
    try {
      final param = UserLoginRequest(
        email: params.email,
        password: params.password,
      );
      await authRepository.signInWithEmailAndPassword(param);
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
      final data = await authRepository.getUser();
      final userEntity = User.fromData(data);
      return userEntity;
    } catch (e) {
      rethrow;
    }
  }

  Future<void> logout() async {
    try {
      await authRepository.signOut();
    } catch (e) {
      rethrow;
    }
  }
}
