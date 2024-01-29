import 'package:flutter_svg/svg.dart';
import 'package:shimmer/shimmer.dart';

import '../../data/const/export.dart';

class ScheduleShimmerCard extends StatelessWidget {
  const ScheduleShimmerCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      baseColor: AppColor.kGreyColor,
      highlightColor: AppColor.kShimmerWhite,
      child: Padding(
        padding: const EdgeInsets.only(top: 20, right: 8, left: 5),
        child: Container(
          height: 120,
          width: double.infinity,
          alignment: Alignment.center,
          decoration: BoxDecoration(
            color: AppColor.kWhiteColor.withOpacity(0.20),
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
            title: const Padding(
              padding: EdgeInsets.symmetric(vertical: 5),
              child: Text(
                ' ',
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: AppColor.kBlackColor,
                    fontSize: 15),
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
              ),
            ),
            subtitle: const Padding(
              padding: EdgeInsets.symmetric(vertical: 5),
              child: Text(
                ' ',
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: AppColor.kGreyColor,
                    fontSize: 13),
                maxLines: 1,
              ),
            ),
            leading: CircleAvatar(
              radius: 25,
              backgroundImage: NetworkImage(scheduleList[0].imageUrl),
            ),
            trailing: FittedBox(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  InkWell(
                    child: CircleAvatar(
                        radius: 18,
                        backgroundColor: AppColor.kPrimaryColor,
                        child: SvgPicture.asset(
                            'assets/svg/tick-svgrepo-com 1.svg')),
                  ),
                  const SizedBox(width: 5),
                  InkWell(
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
      ),
    );
  }
}
