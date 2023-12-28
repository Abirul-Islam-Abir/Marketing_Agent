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
    return SizedBox(
      height: 50,
      width: 250,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(5),
          ),
          backgroundColor: AppColor.kPrimaryColor,
        ),
        onPressed: onTap,
        child: Text(
          text,
          style: const TextStyle(
            fontWeight: FontWeight.bold,
            color: AppColor.kWhiteColor,
          ),
        ),
      ),
    );
  }
}