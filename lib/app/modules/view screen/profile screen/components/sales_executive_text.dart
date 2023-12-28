
import 'package:flutter/material.dart';

import '../../../../theme/app_color.dart';

class SalesExecutiveText extends StatelessWidget {
  const SalesExecutiveText(this.text,{
    super.key,
  });
  final String? text;
  @override
  Widget build(BuildContext context) {
    return   Text(
      text!,
      style: const TextStyle(
          color: AppColor.kGreyColor, fontWeight: FontWeight.w500),
    );
  }
}