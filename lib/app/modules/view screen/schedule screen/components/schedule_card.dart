import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../../../theme/app_color.dart';

class ScheduleCard extends StatelessWidget {
  const ScheduleCard({
    super.key,
    required this.title,
    required this.subtitle,
    required this.image,
    this.doneTap,
    this.sendTap,
  });

  final String title, subtitle, image;
  final Function()? doneTap, sendTap;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 20, right: 8, left: 5),
      child: Container(
        height: 120,
        width: double.infinity,
        alignment: Alignment.center,
        decoration: BoxDecoration(
          color: AppColor.kWhiteColor,
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
          title: Padding(
            padding: const EdgeInsets.symmetric(vertical: 5),
            child: Text(
              title,
              style: const TextStyle(
                fontWeight: FontWeight.bold,
                color: AppColor.kBlackColor,fontSize: 15
              ),
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
            ),
          ),
          subtitle: Padding(
            padding: const EdgeInsets.symmetric(vertical: 5),
            child: Text(
              subtitle,
              style: const TextStyle(
                  fontWeight: FontWeight.bold, color: AppColor.kGreyColor,fontSize: 13),
              maxLines: 1,
            ),
          ),
          leading: CircleAvatar(
            radius: 25,
            backgroundImage: NetworkImage(image),
          ),
          trailing: FittedBox(
            child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                InkWell(
                  onTap: doneTap,
                  child: CircleAvatar(
                      radius: 18,
                      backgroundColor: AppColor.kPrimaryColor,
                      child: SvgPicture.asset(
                          'assets/svg/tick-svgrepo-com 1.svg')),
                ),
                const SizedBox(width: 5),
                InkWell(
                  onTap: sendTap,
                  child: CircleAvatar(
                      radius: 18,
                      backgroundColor: AppColor.kPrimaryColor,
                      child: SvgPicture.asset('assets/svg/Vector.svg')),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}