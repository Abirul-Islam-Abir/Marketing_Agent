import 'package:flutter/material.dart';

import '../../../../theme/app_color.dart';

class LoginButton extends StatelessWidget {
  const LoginButton({super.key, required this.text, this.onTap});

  final Function()? onTap;
  final String text;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 50,
      width: 300,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: AppColor.kWhiteColor,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
        ),
        onPressed: onTap,
        child: Text(
          text,
          style: const TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 20,
              color: AppColor.kPrimaryColor),
        ),
      ),
    );
  }
}
