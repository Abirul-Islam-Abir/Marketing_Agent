import 'dart:async';
import 'dart:math';

import 'package:confetti/confetti.dart';
import 'package:flutter/material.dart';


class AnimateCongratulate extends StatefulWidget {
    const AnimateCongratulate({super.key});

  @override
  State<AnimateCongratulate> createState() => _AnimateCongratulateState();
}

class _AnimateCongratulateState extends State<AnimateCongratulate> {
  bool isPlaying = false;
  final controller = ConfettiController();

  Path drawStar( size) {
    // Method to convert degree to radians
    double degToRad(double deg) => deg * (pi / 180.0);

    // Number of points for the star
    const numberOfPoints = 5;

    // Calculate dimensions and angles
    final halfWidth = size.width / 2;
    final externalRadius = halfWidth;
    final internalRadius = halfWidth / 2.5;
    final degreesPerStep = degToRad(360 / numberOfPoints);
    final halfDegreesPerStep = degreesPerStep / 2;
    final path = Path();
    final fullAngle = degToRad(360);

    // Move to starting point
    path.moveTo(size.width, halfWidth);

    // Iterate through points to create the star shape
    for (double step = 0; step < fullAngle; step += degreesPerStep) {
      path.lineTo(
        halfWidth + externalRadius * cos(step),
        halfWidth + externalRadius * sin(step),
      );
      path.lineTo(
        halfWidth + internalRadius * cos(step + halfDegreesPerStep),
        halfWidth + internalRadius * sin(step + halfDegreesPerStep),
      );
    }

    // Close the path to complete the shape
    path.close();

    return path;
  }
  @override
  void initState() {
    controller.play();
    Timer.periodic(const Duration(seconds: 1), (timer) {
      controller.stop();
    });
    super.initState();
  }
  @override
  void dispose() {

    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ConfettiWidget(
      emissionFrequency: 0.00,
      colors: const [
        Colors.green,
        Colors.blue,
        Colors.pink,
        Colors.orange,
        Colors.purple
      ],
      // manually specify the colors to be used
      createParticlePath: drawStar,
      shouldLoop: true,
      confettiController:  controller,
      blastDirectionality: BlastDirectionality.explosive,
      numberOfParticles: 20,
      minBlastForce: 1,
      maxBlastForce: 10,
    );
  }
}
