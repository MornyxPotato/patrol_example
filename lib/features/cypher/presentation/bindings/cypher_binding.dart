import 'package:get/get.dart';
import 'package:patrol_example/features/cypher/presentation/controllers/cypher_controller.dart';

class CypherBinding implements Bindings {
  @override
  void dependencies() {
    Get.put<CypherController>(CypherController());
  }
}
