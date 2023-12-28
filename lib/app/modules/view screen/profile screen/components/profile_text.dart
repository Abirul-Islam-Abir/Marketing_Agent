import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../../theme/app_color.dart';

class ProfileText extends StatelessWidget {
  const ProfileText(
    this.text, {
    super.key,
  });

  final String? text;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0),
      child:  Text(
        '$text',
        style: const TextStyle(
            fontSize: 30,
            fontWeight: FontWeight.bold,
            color: AppColor.kWhiteColor),
      ),
    );
  }
}
