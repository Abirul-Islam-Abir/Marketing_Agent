
import 'package:amin_agent/app/theme/app_color.dart';
import 'package:circular_profile_avatar/circular_profile_avatar.dart';
import 'package:flutter/material.dart';

class UserAvatar extends StatelessWidget {
  const UserAvatar(
      this.img, {
        super.key,
      });

  final String? img;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: CircularProfileAvatar(
        img!,
        borderColor: AppColor.kPrimaryColor,
        borderWidth: 5,
        elevation: 2,
        radius: 60,
        child: Image.network(img!),
      ),
    );
  }
}