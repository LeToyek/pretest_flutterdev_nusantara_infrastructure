import 'package:pretest_flutterdev_nusantara_infrastructure/infrastructure/dal/daos/models/user_request.dart';
import 'package:pretest_flutterdev_nusantara_infrastructure/infrastructure/dal/daos/models/user_response.dart';
import 'package:pretest_flutterdev_nusantara_infrastructure/infrastructure/dal/services/nusantara_api_client.dart';
import 'package:pretest_flutterdev_nusantara_infrastructure/infrastructure/navigation/bindings/domains/repository/auth_repository.dart';

class AuthRepositoryImpl extends AuthRepository {
  final NusantaraApiClient _nusantaraApiClient;

  AuthRepositoryImpl(this._nusantaraApiClient);
  @override
  Future<UserModelDaos> getUser() async {
    try {
      final res = await _nusantaraApiClient.get("/user");
      final user = UserModelDaos.fromJson(res.data);
      return user;
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<UserLoginResponse> signInWithEmailAndPassword(
      UserLoginRequest user) async {
    try {
      final res = await _nusantaraApiClient.post("/login", data: user.toJson());
      final userResponse = UserLoginResponse.fromJson(res.data);
      return userResponse;
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<UserRegisterResponse> signUp(UserRegisterRequest user) async {
    try {
      final res =
          await _nusantaraApiClient.post("/register", data: user.toJson());
      final userResponse = UserRegisterResponse.fromJson(res.data);
      return userResponse;
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<void> signOut() {
    // TODO: implement signOut
    throw UnimplementedError();
  }
}
