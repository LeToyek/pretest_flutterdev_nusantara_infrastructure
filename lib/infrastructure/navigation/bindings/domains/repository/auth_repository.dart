import 'package:pretest_flutterdev_nusantara_infrastructure/infrastructure/dal/daos/models/user/user_request.dart';
import 'package:pretest_flutterdev_nusantara_infrastructure/infrastructure/dal/daos/models/user/user_response.dart';

abstract class AuthRepository {
  Future<UserLoginResponse> signInWithEmailAndPassword(UserLoginRequest user);
  Future<UserRegisterResponse> signUp(UserRegisterRequest user);
  Future<void> signOut();
  Future<UserModelDaos> getUser();
}
