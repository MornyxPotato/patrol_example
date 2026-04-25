import 'package:get/get.dart';
import 'package:patrol_example/routes/app_pages.dart';

class HomeController extends GetxController {
  void goToCypherScreen() {
    Get.toNamed(Routes.cypher);
  }

  void goToClueScreen() {
    Get.toNamed(Routes.clue);
  }
}
