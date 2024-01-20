import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../../../theme/app_color.dart';

class CustomFloatingButton extends StatelessWidget {
  const CustomFloatingButton({
    super.key,
    this.onTap,
    required this.image,
  });

  final Function()? onTap;
  final String image;

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(50),
      ),
      onPressed: onTap,
      backgroundColor: AppColor.kPrimaryColor,
      child: Padding(
        padding: const EdgeInsets.all(12),
        child: SvgPicture.asset(
          image,
        ),
      ),
    );
  }
}
