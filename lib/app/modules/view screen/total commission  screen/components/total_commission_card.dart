import 'package:flutter_svg/svg.dart';

import '../../../../data/const/export.dart';

class TotalCommissionCard extends StatelessWidget {
  const TotalCommissionCard({
    super.key,
    required this.location,
    required this.target,
    required this.date,
    this.sendTap,
  });

  final String location, target, date;
  final Function()? sendTap;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 15, right: 15, top: 20),
      child: Container(
        height: 120,
        padding: const EdgeInsets.symmetric(horizontal: 20),
        width: Get.width / 0.9,
        decoration: BoxDecoration(
          color: AppColor.kWhiteColor.withOpacity(0.20),
          borderRadius: BorderRadius.circular(10),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  location,
                  style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      color: AppColor.kWhiteColor,
                      fontSize: 20),
                ),
                Text(
                  date,
                  style:
                      const TextStyle(color: AppColor.kWhiteColor, fontSize: 16),
                ),
              ],
            ),
            const SizedBox(height: 5),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  '\$$target',
                  style: const TextStyle(
                      color: AppColor.kWhiteColor,
                      fontSize: 16,
                      fontWeight: FontWeight.bold),
                ),
                InkWell(
                  onTap: sendTap,
                  child: CircleAvatar(
                    radius: 25,
                    backgroundColor: AppColor.kWhiteColor,
                    child: SvgPicture.asset(
                      'assets/svg/Vector.svg',
                      color: AppColor.kPrimaryColor,

                      height: 30,
                      width: 30,
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
