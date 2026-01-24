import 'package:patrol/patrol.dart';
import 'package:patrol_example/core/di/core_injector.dart';
import 'package:patrol_example/main.dart';

Future<void> initApp(PatrolIntegrationTester $) async {
  registerDependencies();
  await $.pumpWidgetAndSettle(const MyApp());
}
