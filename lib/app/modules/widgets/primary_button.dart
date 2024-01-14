import 'package:flutter/material.dart';

import '../../theme/app_color.dart';

class PrimaryButton extends StatelessWidget {
  final String text;
  final Function()? onTap;

  const PrimaryButton({
    super.key,
    required this.text,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50,
      width: 250,
      decoration: BoxDecoration(
          color: AppColor.kPrimaryColor,
          borderRadius: BorderRadius.circular(5)),
      child: ElevatedButton(
        onPressed: onTap,
        child: Text(
          text,
          style: TextStyle(
            fontWeight: FontWeight.bold,
            color: AppColor.kWhiteColor,
          ),
        ),
      ),
    );
  }
}
