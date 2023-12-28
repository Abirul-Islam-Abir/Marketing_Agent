import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../theme/app_color.dart';

class ProfileBackButton extends StatelessWidget {
  const ProfileBackButton({super.key});



  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(
            height: 50,
            child: Card(
              child: IconButton(
                onPressed: (){Get.back();},
                icon: const Icon(
                  Icons.arrow_back_ios_new_rounded,
                  color: AppColor.kPrimaryColor,
                ),
              ),
            ),
          ),
          const Text(
            '',
            style: TextStyle(
                fontSize: 30,
                fontWeight: FontWeight.bold,
                color: AppColor.kWhiteColor),
          ),
          const Text(''),
        ],
      ),
    );
  }
}