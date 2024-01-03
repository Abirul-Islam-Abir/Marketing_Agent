import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

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
      padding:   EdgeInsets.only(top: 20.sp, right: 12, left: 12),
      child: Dismissible(
        key: UniqueKey(),
        background: Container(
          height: 120,
          width: double.infinity,
          alignment: Alignment.center,
          decoration: BoxDecoration(
            color: AppColor.kPrimaryColor,
            borderRadius: BorderRadius.circular(10),
            boxShadow: [
              BoxShadow(
                color: AppColor.kPrimaryColor.withOpacity(0.2),
                spreadRadius: 5,
                blurRadius: 7,
                offset:
                    const Offset(0, 3), // changes the position of the shadow
              ),
            ],
          ),
        ),
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
                offset:
                    const Offset(0, 3), // changes the position of the shadow
              ),
            ],
          ),
          child: ListTile(
            title: Text(
              title,
              style: const TextStyle(
                  fontWeight: FontWeight.bold, color: AppColor.kBlackColor),
            ),
            subtitle: Text(
              subtitle,
              style: const TextStyle(
                  fontWeight: FontWeight.bold, color: AppColor.kGreyColor),
            ),
            leading: CircleAvatar(
              radius: 30,
              backgroundImage: NetworkImage(image),
            ),
            trailing: FittedBox(
              child: Row(
                children: [
                  InkWell(
                    onTap: doneTap,
                    child: CircleAvatar(
                        radius: 20,
                        backgroundColor: AppColor.kPrimaryColor,
                        child: SvgPicture.asset(
                            'assets/svg/tick-svgrepo-com 1.svg')),
                  ),
                  const SizedBox(
                    width: 20,
                  ),
                  InkWell(
                    onTap: sendTap,
                    child: CircleAvatar(
                        radius: 20,
                        backgroundColor: AppColor.kPrimaryColor,
                        child: SvgPicture.asset('assets/svg/Vector.svg')),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
