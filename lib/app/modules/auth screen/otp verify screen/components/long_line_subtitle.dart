
import 'package:flutter/gestures.dart';

import '../../../../data/const/export.dart';

class LongLineSubtitleText extends StatelessWidget {
  final String txt, text;
  final GestureTapCallback? onTap;

  const LongLineSubtitleText(
      {super.key, required this.txt, required this.text, this.onTap});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 30.0, vertical: 8),
      child: RichText(
        text: TextSpan(
          text: text,
          children: [
            TextSpan(
              text: txt,
              style: const TextStyle(
                color: AppColor.kGreenColor,
                fontWeight: FontWeight.bold,
                fontSize: 15,
              ),
              recognizer: TapGestureRecognizer()..onTap = onTap,
            ),
          ],
          style: const TextStyle(
            color: AppColor.kWhiteColor,
            fontSize: 15,
          ),
        ),
        textAlign: TextAlign.center,
      ),
    );
  }
}