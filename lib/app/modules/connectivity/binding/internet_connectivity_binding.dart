import 'package:get/get.dart';

import '../controller/internet_connectivity.dart';

class NetworkBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => NetworkController());
  }
}