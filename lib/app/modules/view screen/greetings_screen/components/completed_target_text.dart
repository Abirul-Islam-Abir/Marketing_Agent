import 'package:flutter/material.dart';

import '../../../../theme/app_color.dart';


class CompletedTargetText extends StatelessWidget {
  const CompletedTargetText(
      this.text, {
        super.key,
      });

  final String? text;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 50, vertical: 10),
      child: Text(
        text!,
        style: const TextStyle(
            color: AppColor.kWhiteColor,
            fontWeight: FontWeight.w500,
            fontSize: 18,),textAlign: TextAlign.center,
      ),
    );
  }
}