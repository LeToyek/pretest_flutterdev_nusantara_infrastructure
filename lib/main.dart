import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:get/get.dart';
import 'package:pretest_flutterdev_nusantara_infrastructure/infrastructure/dal/services/cache_manager.dart';
import 'package:pretest_flutterdev_nusantara_infrastructure/infrastructure/dal/services/nusantara_api_client.dart';
import 'package:pretest_flutterdev_nusantara_infrastructure/presentation/app.dart';

import 'infrastructure/navigation/routes.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await dotenv.load(fileName: ".env");
  await initServices();
  var initialRoute = await Routes.initialRoute;
  runApp(App(initialRoute));
}

Future<void> initServices() async {
  await Get.putAsync(() => CacheManager().init());
  Get.put(NusantaraApiClient(Get.find()), permanent: true);
}
