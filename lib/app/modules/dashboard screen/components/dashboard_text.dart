import 'package:flutter/material.dart';

import '../../../theme/app_color.dart';

class DashboardText extends StatelessWidget {
  const DashboardText(this.text,{
    super.key,
  });
  final String? text;
  @override
  Widget build(BuildContext context) {
    return Text(
      text!,
      style: TextStyle(
          fontWeight: FontWeight.bold,
          fontSize: 30,
          color: AppColor.kWhiteColor),
    );
  }
}