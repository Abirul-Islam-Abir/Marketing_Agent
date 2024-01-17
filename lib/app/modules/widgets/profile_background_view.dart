import 'package:flutter/cupertino.dart';

import '../../data/utils/app_images.dart';


class ProfileBackgroundView extends StatelessWidget {
  const ProfileBackgroundView({
    super.key,

    this.child,
  });
  final Widget? child;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        image: DecorationImage(
            image: AssetImage(AppImages.profileScreenBackground),
            fit: BoxFit.fitWidth,
            alignment: Alignment.topCenter),
      ),
      child: child,
    );
  }
}
