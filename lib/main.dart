import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:pretest_flutterdev_nusantara_infrastructure/domain/utils/dependecy_creator.dart';
import 'package:pretest_flutterdev_nusantara_infrastructure/infrastructure/theme/main_theme.dart';

import 'infrastructure/navigation/navigation.dart';
import 'infrastructure/navigation/routes.dart';

void main() async {
  await dotenv.load(fileName: ".env");
  DependencyCreator.init();
  await GetStorage.init();

  var initialRoute = await Routes.initialRoute;
  runApp(Main(initialRoute));
}

class Main extends StatelessWidget {
  final String initialRoute;
  const Main(this.initialRoute, {super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
        initialRoute: initialRoute,
        getPages: Nav.routes,
        theme: MainTheme.light);
  }
}
