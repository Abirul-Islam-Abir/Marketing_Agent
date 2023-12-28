
import 'package:flutter/material.dart';

import '../../../../theme/app_color.dart';

class CustomDivider extends StatelessWidget {
  const CustomDivider({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const Padding(
        padding: EdgeInsets.symmetric(horizontal: 30),
        child: Divider(height: 3, color: AppColor.kWhiteColor));
  }
}