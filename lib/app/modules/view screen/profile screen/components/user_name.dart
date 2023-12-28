import 'package:flutter/material.dart';

import '../../../../theme/app_color.dart';

class UserName extends StatelessWidget {
  const UserName(this.name,{
    super.key,
  });
  final String? name;
  @override
  Widget build(BuildContext context) {
    return   Padding(
      padding: const EdgeInsets.all(8.0),
      child: Text(
        name!,
        style: const TextStyle(
            fontSize: 30,
            fontWeight: FontWeight.bold,
            color: AppColor.kBlackColor),
      ),
    );
  }
}