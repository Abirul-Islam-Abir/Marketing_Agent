import 'package:amin_agent/app/modules/view%20screen/profile%20screen/components/picture_and_target_button.dart';
import 'package:flutter/material.dart';

import '../../../../theme/app_color.dart';

class PictureAndTargetCard extends StatelessWidget {
  final String picture, target;
  final int index;
  final Function()? pictureTap, targetTap;

  const PictureAndTargetCard(
      {super.key,
        required this.picture,
        required this.target,
        required this.index,
        this.pictureTap,
        this.targetTap});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        PictureAndTargetButton(
          backColor: index == 0 ? AppColor.kPrimaryColor : null,
          textColor: index == 0 ? AppColor.kWhiteColor : AppColor.kPrimaryColor,
          text: picture,
          tap: pictureTap,
        ),
        const SizedBox(
          width: 10,
        ),
        PictureAndTargetButton(
          text: target,
          tap: targetTap,
          backColor: index == 1 ? AppColor.kPrimaryColor : null,
          textColor: index == 1 ? AppColor.kWhiteColor : AppColor.kPrimaryColor,
        ),
      ],
    );
  }
}