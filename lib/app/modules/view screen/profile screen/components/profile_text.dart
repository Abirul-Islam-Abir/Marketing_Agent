import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../../theme/app_color.dart';

class ProfileText extends StatelessWidget {
  const ProfileText(
    this.text, {
    super.key, this.onTap,
  });

  final String? text;
final Function()? onTap;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          IconButton(
            onPressed: onTap,
            icon: Icon(
              Icons.arrow_back_ios_new_rounded,
              color: AppColor.kWhiteColor,
            ),
          ),
          Text(
            '$text      ',
            style: TextStyle(
                fontSize: 30,
                fontWeight: FontWeight.bold,
                color: AppColor.kWhiteColor),
          ),
          Text(''),
        ],
      ),
    );
  }
}
