import 'package:get/get.dart';
import 'package:patrol_example/core/presentation/controllers/home_controller.dart';

class HomeBinding implements Bindings {
  @override
  void dependencies() {
    Get.put<HomeController>(HomeController());
  }
}
