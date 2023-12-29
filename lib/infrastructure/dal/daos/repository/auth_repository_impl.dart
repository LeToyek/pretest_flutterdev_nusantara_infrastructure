import 'package:dio/dio.dart';
import 'package:pretest_flutterdev_nusantara_infrastructure/infrastructure/dal/daos/http_exception.dart';
import 'package:pretest_flutterdev_nusantara_infrastructure/infrastructure/dal/daos/models/user/user_request.dart';
import 'package:pretest_flutterdev_nusantara_infrastructure/infrastructure/dal/daos/models/user/user_response.dart';
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
    } on DioException catch (e) {
      if (e.response!.statusCode == 401) {
        throw HttpException("Unauthorized", 401);
      }
      rethrow;
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
    } on DioException catch (e) {
      if (e.response!.statusCode == 401) {
        throw HttpException("Email atau password salah", 401);
      }
      rethrow;
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
    } on DioException catch (e) {
      if (e.response!.statusCode == 422) {
        throw HttpException("Email sudah terdaftar", 422);
      }
      rethrow;
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<void> signOut() async {
    try {
      await _nusantaraApiClient.delete("/user/logout");
    } catch (e) {
      rethrow;
    }
  }
}
