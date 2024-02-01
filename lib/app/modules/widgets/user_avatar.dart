import 'dart:io';

import 'package:amin_agent/app/theme/app_color.dart';
import 'package:flutter/material.dart';

class UserAvatar extends StatelessWidget {
  const UserAvatar(
    this.img, {
    super.key,
    this.selectedImagePath = '',
  });

  final String? img;
  final String? selectedImagePath;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        height: 120,
        width: 120,
        decoration: BoxDecoration(
          color: AppColor.kWhiteColor,
          borderRadius: BorderRadius.circular(100),
          border: Border.all(width: 2, color: AppColor.kPrimaryColor),
          image: selectedImagePath!.isNotEmpty
              ? DecorationImage(
                  image: FileImage(File(selectedImagePath!)), fit: BoxFit.  fill)
              : DecorationImage(image: NetworkImage(img!), fit: BoxFit.fill),
        ),
      ),
    );
  }
}