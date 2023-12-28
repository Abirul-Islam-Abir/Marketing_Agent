
import 'package:flutter/material.dart';

import '../../../theme/app_color.dart';
class BottomNavItems extends StatelessWidget {
  const BottomNavItems({
    super.key,
    required this.text,
    required this.icon,
    required this.onTap,
  });

  final String text;
  final IconData icon;
  final Function() onTap;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: InkWell(
        onTap: onTap,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              icon,
              size: 30,
              color: AppColor.kPrimaryColor,
            ),
            Text(
              text,
              style: const TextStyle(
                  fontWeight: FontWeight.bold, color: AppColor.kPrimaryColor),
            )
          ],
        ),
      ),
    );
  }
}