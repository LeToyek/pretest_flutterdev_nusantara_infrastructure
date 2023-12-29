import 'dart:convert';

import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:pretest_flutterdev_nusantara_infrastructure/infrastructure/navigation/bindings/domains/entities/user.dart';

class CacheManager extends GetxService {
  GetStorage? _storage;

  Future<CacheManager> init() async {
    await GetStorage.init();
    _storage = GetStorage();
    return this;
  }

  Future<void> saveToken(String token) async {
    await _storage!.write(_Key.token.toString(), token);
  }

  Future<void> removeToken() async {
    await _storage!.remove(_Key.token.toString());
  }

  String? getToken() {
    return _storage!.read(_Key.token.toString());
  }

  User? get user {
    final rawJson = _storage!.read(_Key.user.toString());
    if (rawJson == null) {
      return null;
    }
    Map<String, dynamic> json = jsonDecode(rawJson);
    return User.fromJson(json);
  }

  Future<void> saveUser(User? user) async {
    if (user == null) {
      await _storage!.remove(_Key.user.toString());
    } else {
      await _storage!.write(_Key.user.toString(), jsonEncode(user.toJson()));
    }
  }
}

enum _Key { token, user }
