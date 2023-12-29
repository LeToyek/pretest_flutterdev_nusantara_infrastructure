import 'package:dio/dio.dart';
import 'package:pretest_flutterdev_nusantara_infrastructure/config.dart';
import 'package:pretest_flutterdev_nusantara_infrastructure/infrastructure/dal/services/cache_manager.dart';

class NusantaraApiClient with DioMixin implements Dio {
  final CacheManager _cacheManager;
  NusantaraApiClient(this._cacheManager) {
    options = BaseOptions(
      baseUrl: ConfigEnvironments.getEnvironments()['url']!,
      headers: {
        'Content-Type': 'application/json',
        'Accept': 'application/json',
      },
    );

    interceptors.add(InterceptorsWrapper(onRequest: (options, handler) async {
      final token = _cacheManager.getToken();

      print("Token: $token");

      if (token != null) {
        options.headers['Authorization'] = 'Bearer $token';
      }
      return handler.next(options);
    }));

    httpClientAdapter = HttpClientAdapter();
  }
}
