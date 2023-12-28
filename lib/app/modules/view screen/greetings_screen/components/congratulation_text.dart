import 'package:flutter/material.dart';

import '../../../../theme/app_color.dart';

class CongratulationText extends StatelessWidget {
  const CongratulationText(
      this.text, {
        super.key,
      });

  final String? text;

  @override
  Widget build(BuildContext context) {
    return Text(
      text!,
      style:
      const TextStyle(color: AppColor.kWhiteColor, fontWeight: FontWeight.bold),
    );
  }
}