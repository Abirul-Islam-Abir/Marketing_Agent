import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../../../theme/app_color.dart';

class UserCardLocation extends StatelessWidget {
  const UserCardLocation({
    super.key,
    required this.title,
    required this.subtitle,
    required this.image,
    this.sendTap,
  });

  final String title, subtitle, image;
  final Function()?   sendTap;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 12),
      child: Container(
        height: 80,
        width: double.infinity,
        alignment: Alignment.center,
        decoration: BoxDecoration(
          color:AppColor.kWhiteColor,
          borderRadius: BorderRadius.circular(10),
          boxShadow: [
            BoxShadow(
              color: AppColor.kPrimaryColor.withOpacity(0.2),
              spreadRadius: 5,
              blurRadius: 7,
              offset: const Offset(0, 3), // changes the position of the shadow
            ),
          ],
        ),
        child: ListTile(
          title: Text(
            title,
            style: const TextStyle(fontWeight: FontWeight.bold,color: AppColor.kGreyColor),
          ),
          subtitle: Text(subtitle,
            style: const TextStyle( color: AppColor.kGreyColor),),
          leading: CircleAvatar(
            radius: 30,
            backgroundImage: NetworkImage(image),
          ),
          trailing: InkWell(
            onTap: sendTap,
            child: CircleAvatar(
                radius: 20,
                backgroundColor: AppColor.kPrimaryColor,
                child: SvgPicture.asset('assets/svg/Vector.svg')),
          ),
        ),
      ),
    );
  }
}