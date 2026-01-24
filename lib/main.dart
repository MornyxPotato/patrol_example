import 'package:flutter/material.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:patrol_example/core/di/core_injector.dart';
import 'package:patrol_example/routes/app_pages.dart';

void main() {
  registerDependencies();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Patrol Example',
      initialRoute: Routes.home,
      getPages: AppPages.getRoutes(),
    );
  }
}
