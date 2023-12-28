import 'package:flutter/material.dart';

import '../../../../theme/app_color.dart';

class VisitDoctorCard extends StatelessWidget {
  const VisitDoctorCard({
    super.key,
    required this.text,
    required this.doneCount,
    required this.daysCount,
    required this.progress,
  });

  final String text, doneCount, daysCount;
  final double progress;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10,vertical: 8),
      child: Container(
        height: 140,
        alignment: Alignment.center,
        decoration: BoxDecoration(
          color: AppColor.kPrimaryColor,
          borderRadius: BorderRadius.circular(10),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Text(
              text,
              style: const TextStyle(
                  color: AppColor.kWhiteColor,
                  fontSize: 16,
                  fontWeight: FontWeight.bold),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 25),
              child: Row(
                mainAxisAlignment: MainAxisAlignment. spaceBetween,
                children: [
                  Text(
                    '$doneCount done',
                    style: const TextStyle(
                        color: AppColor.kWhiteColor,
                        fontWeight: FontWeight.normal),
                  ),
                  Text(
                    'Time: $daysCount days left',
                    style: const TextStyle(
                        color: AppColor.kWhiteColor,
                        fontWeight: FontWeight.normal),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 0),
              child: Container(
                height: 15,
                decoration: BoxDecoration(
                  color: AppColor.kWhiteColor,
                  border: Border.all(width: 2, color: AppColor.kWhiteColor),
                  borderRadius: BorderRadius.circular(50),
                ),
                width: double.infinity,
                child: Stack(
                  children: [
                    LayoutBuilder(
                      builder: (context, constraints) => Container(
                        width: constraints.maxWidth * progress,
                        decoration: BoxDecoration(
                          color: AppColor.kPrimaryColor,
                          borderRadius: BorderRadius.circular(50),
                        ),
                      ),
                    )
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
