import 'package:flutter/material.dart';

import '../../data/utils/app_images.dart';

class PrimaryBackgroundView extends StatelessWidget {
  const PrimaryBackgroundView({
    super.key,
    required this.child,
  });

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Stack(
      fit: StackFit.expand,
      alignment: Alignment.center,
      children: [
        Positioned(
          top: 0,
          right: 0,
          left: 0,
          child: Image.asset(
            AppImages.loginScreenBackground,
            fit: BoxFit.cover,
          ),
        ),
        child,
      ],
    );
  }
}


