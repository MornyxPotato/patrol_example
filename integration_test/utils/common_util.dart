import 'package:flutter/material.dart';
import 'package:patrol_example/core/di/core_injector.dart';
import 'package:patrol_example/main.dart';

abstract class CommonUtil {
  static Future<void> openApplication($) async {
    registerDependencies();

    await $.pumpWidget(runApp(const MyApp()));
  }
}
