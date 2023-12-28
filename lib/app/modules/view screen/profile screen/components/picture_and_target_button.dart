
import 'package:flutter/material.dart';

import '../../../../theme/app_color.dart';

class PictureAndTargetButton extends StatelessWidget {
  const PictureAndTargetButton({
    super.key,
    required this.text,
    this.tap,
    required this.backColor,
    required this.textColor,
  });

  final String text;
  final Function()? tap;
  final Color? backColor, textColor;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: tap,
      child: Container(
        height: 40,
        width: 160,
        decoration: BoxDecoration(
          border: Border.all(width: 01, color: AppColor.kPrimaryColor),
          color: backColor,
          borderRadius: BorderRadius.circular(5),
        ),
        child: Center(
          child: Text(
            text,
            style: TextStyle(
                fontWeight: FontWeight.bold, fontSize: 20, color: textColor),
          ),
        ),
      ),
    );
  }
}