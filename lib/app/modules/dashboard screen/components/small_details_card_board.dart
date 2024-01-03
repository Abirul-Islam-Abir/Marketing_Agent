import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../theme/app_color.dart';

class SmallDetailsDashboardCard extends StatelessWidget {
  const SmallDetailsDashboardCard({
    super.key,
    required this.leftTitle,
    required this.rightTitle,
    required this.leftCount,
    required this.rightCount,
  });
  final String leftTitle, rightTitle, leftCount, rightCount;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 100,
      width: Get.width,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 8),
        child: Row(
          children: [
            Expanded(
              child: Container(
                decoration: BoxDecoration(
                  color: AppColor.kWhiteColor.withOpacity(0.20),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      leftTitle,
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: AppColor.kWhiteColor),
                    ),
                    Text(
                      leftCount,
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: AppColor.kWhiteColor,
                          fontSize: 25),
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(
              width: 10,
            ),
            Expanded(
              child: Container(
                decoration: BoxDecoration(
                  color: AppColor.kWhiteColor.withOpacity(0.20),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      rightTitle,
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: AppColor.kWhiteColor),
                    ),
                    Text(
                      rightCount,
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: AppColor.kWhiteColor,
                          fontSize: 25),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}