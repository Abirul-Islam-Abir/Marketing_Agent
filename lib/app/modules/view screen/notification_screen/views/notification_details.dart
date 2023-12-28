import 'package:amin_agent/app/modules/widgets/primary_appbar.dart';
import 'package:flutter/material.dart';

import '../../../../data/utils/app_string.dart';
import '../../../../theme/app_color.dart';

class NotificationDetailsScreen extends StatelessWidget {
  const NotificationDetailsScreen(
      {super.key, required this.data, required this.day, required this.time, required this.name});

  final String data, day, time,name;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: notificationAppbar(AppString.notification,(){}),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 10),
        child: Container(
          height: 250,
          width: double.infinity,
          padding: const EdgeInsets.all(12),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                    Text(name,
                      style: const TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 20,
                          color: AppColor.kPrimaryColor)),
                  Row(
                    children: [
                      Text(
                        day,
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
              const SizedBox(height: 5),
              Text(
                data,
                style: const TextStyle(
                    fontWeight: FontWeight.bold, color: AppColor.kBlackColor),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
