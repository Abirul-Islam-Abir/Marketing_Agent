import 'package:flutter/material.dart';

import '../../../../theme/app_color.dart';

class ForgetButton extends StatelessWidget {
  const ForgetButton({
    super.key, required this.text, this.onPressed,
  });
  final String text;
  final Function()? onPressed;
  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.centerRight,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: TextButton(
          onPressed:onPressed ,
          child: Text(
            text,
            style:   const TextStyle(fontWeight: FontWeight.bold,color: AppColor.kWhiteColor,fontSize: 18),
          ),
        ),
      ),
    );
  }
}