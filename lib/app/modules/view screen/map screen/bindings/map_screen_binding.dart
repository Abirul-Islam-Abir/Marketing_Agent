import 'package:amin_agent/app/modules/view%20screen/map%20screen/controllers/default_map_controller.dart';
import 'package:get/get.dart';

import '../controllers/map_screen_controller.dart';

class MapScreenBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<MapScreenController>(
      () => MapScreenController(),
    );
    Get.lazyPut<DefaultMapController>(
          () => DefaultMapController(),
    );
  }
}