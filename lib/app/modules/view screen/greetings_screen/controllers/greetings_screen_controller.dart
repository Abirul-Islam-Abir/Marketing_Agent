
import 'dart:async';

import 'package:confetti/confetti.dart';
import 'package:get/get.dart';

class GreetingsScreenController extends GetxController {
  bool isPlaying = false;
  final controller = ConfettiController();

  @override
  void onInit() {
    controller.play();
    Timer.periodic(const Duration(seconds: 1), (timer) {
      controller.stop();
    });
    super.onInit();
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }
}
