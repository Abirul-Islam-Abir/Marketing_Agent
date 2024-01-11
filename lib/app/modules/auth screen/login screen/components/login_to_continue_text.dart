
import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../../../../theme/app_color.dart';

class LoginToContinueText extends StatelessWidget {
  const LoginToContinueText(
      this.text, {
        super.key,
      });

  final String? text;

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.centerLeft,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 0),
        child: Text(
          text!,
          style:   TextStyle(
              fontSize: 18.sp,
              fontWeight: FontWeight.normal,
              color: AppColor.kWhiteColor),
        ),
      ),
    );
  }
}