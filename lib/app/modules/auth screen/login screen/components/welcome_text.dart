import 'package:amin_agent/app/theme/app_color.dart';
import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class WelcomeText extends StatelessWidget {
  const WelcomeText({
    super.key,
    required this.text,
  });

  final String text;

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.centerLeft,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 10),
        child: Text(
          text,
          style:   TextStyle(
              fontSize: 30.sp,
              fontWeight: FontWeight.bold,
              color: AppColor.kWhiteColor),
        ),
      ),
    );
  }
}
