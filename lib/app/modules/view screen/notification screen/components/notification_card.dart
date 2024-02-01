import 'package:flutter/material.dart';
import 'package:readmore/readmore.dart';

import '../../../../theme/app_color.dart';

class NotificationCard extends StatelessWidget {
  const NotificationCard({
    super.key,
    required this.data,
    required this.time,
    required this.title,
  });

  final String data,   time, title;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 30, right: 10, left: 10),
      child: Container(
        width: double.infinity,
        padding: const EdgeInsets.all(12),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10),
          boxShadow: [
            BoxShadow(
              color: AppColor.kPrimaryColor.withOpacity(0.2),
              spreadRadius: 5,
              blurRadius: 7,
              offset: const Offset(0, 3), // changes position of shadow
            ),
          ],
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(title,
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 16,
                        color: AppColor.kPrimaryColor)),
                Row(
                  children: [
                    Text(
                      '',
                      style: const TextStyle(
                          fontWeight: FontWeight.bold,
                          color: AppColor.kGreyColor),
                    ),
                    const SizedBox(width: 5),
                    Text(
                      time,
                      style: const TextStyle(
                          fontWeight: FontWeight.bold,
                          color: AppColor.kGreyColor),
                    ),
                  ],
                )
              ],
            ),
            const SizedBox(height: 10),
            ReadMoreText(
              data,
              trimLines: 3,
              style: const TextStyle(color: AppColor.kBlackColor),
              colorClickableText: AppColor.kBlueColor,
              trimMode: TrimMode.Line,
              trimCollapsedText: 'Read more',
              trimExpandedText: ' Less',
            ),
            const SizedBox(height: 10),
          ],
        ),
      ),
    );
  }
}