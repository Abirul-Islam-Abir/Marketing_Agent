import 'package:flutter/cupertino.dart';


class ProfileBackgroundView extends StatelessWidget {
  const ProfileBackgroundView({
    super.key,
    required this.image,
    this.child,
  });

  final String image;
  final Widget? child;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        image: DecorationImage(
            image: AssetImage(image),
            fit: BoxFit.fitWidth,
            alignment: Alignment.topCenter),
      ),
      child: child,
    );
  }
}
