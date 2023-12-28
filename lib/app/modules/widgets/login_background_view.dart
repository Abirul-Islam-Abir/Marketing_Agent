import 'package:flutter/material.dart';

class LoginBackgroundView extends StatelessWidget {
  const LoginBackgroundView({
    super.key,
    required this.child,
    required this.image,
  });

  final Widget child;
  final String image;

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
            image,
            fit: BoxFit.cover,
          ),
        ),
        child,
      ],
    );
  }
}


