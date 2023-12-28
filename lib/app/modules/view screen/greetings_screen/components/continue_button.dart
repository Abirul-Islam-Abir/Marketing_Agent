import 'package:flutter/material.dart';

import '../../../../theme/app_color.dart';

class ContinueButton extends StatelessWidget {
  const ContinueButton({
    super.key,
    required this.text,
    this.onTap,
  });

  final String text;
  final Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        height: 45,
        width: 250,
        decoration: BoxDecoration(
          color: AppColor.kWhiteColor,
          borderRadius: BorderRadius.circular(20),
        ),
        child: Center(
            child: Text(
              text,
              style: const TextStyle(
                  fontWeight: FontWeight.bold, color: AppColor.kPrimaryColor),
            )),
      ),
    );
  }
}