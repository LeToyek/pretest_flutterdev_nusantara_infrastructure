import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pretest_flutterdev_nusantara_infrastructure/infrastructure/navigation/navigation.dart';
import 'package:pretest_flutterdev_nusantara_infrastructure/infrastructure/theme/main_theme.dart';

class App extends StatelessWidget {
  final String initialRoute;
  const App(this.initialRoute, {super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
        initialRoute: initialRoute,
        getPages: Nav.routes,
        theme: MainTheme.light);
  }
}
