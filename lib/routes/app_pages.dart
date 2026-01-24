import 'package:get/get.dart';
import 'package:patrol_example/core/presentation/bindings/home_binding.dart';
import 'package:patrol_example/core/presentation/screens/home_screen.dart';
import 'package:patrol_example/features/cypher/presentation/bindings/cypher_binding.dart';
import 'package:patrol_example/features/cypher/presentation/screens/cypher_screen.dart';

part 'app_routes.dart';

class AppPages {
  static Transition getTransition() {
    return Transition.native;
  }

  static List<GetPage> getRoutes() {
    return [
      GetPage(
        name: Routes.home,
        page: () => const HomeScreen(),
        binding: HomeBinding(),
        transition: getTransition(),
      ),

      GetPage(
        name: Routes.cypher,
        page: () => const CypherScreen(),
        binding: CypherBinding(),
        transition: getTransition(),
      ),
    ];
  }
}
