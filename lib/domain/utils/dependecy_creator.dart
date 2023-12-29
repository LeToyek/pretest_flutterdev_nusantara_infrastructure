import 'package:get/get.dart';
import 'package:pretest_flutterdev_nusantara_infrastructure/infrastructure/dal/daos/repository/auth_repository_impl.dart';
import 'package:pretest_flutterdev_nusantara_infrastructure/infrastructure/dal/services/cache_manager.dart';
import 'package:pretest_flutterdev_nusantara_infrastructure/infrastructure/dal/services/nusantara_api_client.dart';

class DependencyCreator {
  static init() {
    Get.lazyPut(() => CacheManager());
    Get.lazyPut(() => NusantaraApiClient(Get.find<CacheManager>()));
    Get.lazyPut(() => AuthRepositoryImpl(Get.find<NusantaraApiClient>()));
  }
}
