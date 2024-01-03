import 'package:flutter/material.dart';

import '../../../theme/app_color.dart';

class BottomNavItems extends StatelessWidget {
  const BottomNavItems({
    super.key,
    required this.text,
    required this.icon,
    required this.onTap,
    required this.selectedIndex,
  });

  final String text;
  final IconData icon;
  final Function() onTap;
  final int selectedIndex;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: InkWell(
        onTap: onTap,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              icon,
              size: 25,
              color: selectedIndex == 0
                  ? AppColor.kPrimaryColor
                  : AppColor.kGreyColor,
            ),
            Text(
              text,
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: selectedIndex == 0
                      ? AppColor.kPrimaryColor
                      : AppColor.kGreyColor),
            )
          ],
        ),
      ),
    );
  }
}
