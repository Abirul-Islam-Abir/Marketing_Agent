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
    return Padding(
      padding: const EdgeInsets.all(8),
      child: Container(
        height: 50,
        width: 250,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(5)),
        child: ElevatedButton(
          style: ElevatedButton.styleFrom( backgroundColor: AppColor.kWhiteColor,),
          onPressed: onTap,
          child: Text(
            text,
            style: const TextStyle(
              fontWeight: FontWeight.bold,
              color: AppColor.kPrimaryColor,
            ),
          ),
        ),
      ),
    );
  }
}

class SecondaryButton extends StatelessWidget {
  final String text;
  final Function()? onTap;
  const SecondaryButton({
    super.key,
    required this.text,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8),
      child: Container(
        height: 50,
        width: 250,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(5)),
        child: ElevatedButton(
          style: ElevatedButton.styleFrom( backgroundColor: AppColor.kPrimaryColor,),
          onPressed: onTap,
          child: Text(
            text,
            style: const TextStyle(
              fontWeight: FontWeight.bold,
              color: AppColor.kWhiteColor,

            ),
          ),
        ),
      ),
    );
  }
}
