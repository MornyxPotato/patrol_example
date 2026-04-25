import 'package:get/get.dart';
import 'package:patrol_example/features/clue_note/presentation/controllers/clue_controller.dart';

class ClueBinding implements Bindings {
  @override
  void dependencies() {
    Get.put<ClueController>(ClueController());
  }
}
