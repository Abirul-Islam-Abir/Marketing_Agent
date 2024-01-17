import 'package:flutter/material.dart';

import '../../../../theme/app_color.dart';

class LoginButton extends StatelessWidget {
  const LoginButton(
      {super.key, required this.text, this.onTap, required this.isProgress,   this.color = AppColor.kWhiteColor});

  final Function()? onTap;
  final String text;
  final bool isProgress;
  final Color color;
  @override
  Widget build(BuildContext context) {
    return isProgress
        ? const CircularProgressIndicator(color: AppColor.kWhiteColor)
        : SizedBox(
            height: 50,
            width: 300,
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: color,
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
                    color: AppColor.kPrimaryColor,),
              ),
            ),
          );
  }
}
