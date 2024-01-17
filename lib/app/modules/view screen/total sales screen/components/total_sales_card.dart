import 'package:flutter_svg/svg.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../../../../data/const/export.dart';

class TotalSalesCard extends StatelessWidget {
  const TotalSalesCard({
    super.key,
    required this.invoiceNb,
    required this.date,
    required this.name,
    required this.price,
    this.sendTap,
    required this.location,
  });

  final String invoiceNb, date, name, price, location;

  final Function()? sendTap;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 15,right: 15, top: 20),
      child: Container(
        height: 150,
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
                  invoiceNb,
                  style: TextStyle(
                      color: AppColor.kWhiteColor,
                      fontSize: 14.sp),
                ),
                Text(
                 date,
                  style: TextStyle(
                      color: AppColor.kWhiteColor,
                      fontSize: 14.sp, ),
                ),
              ],
            ),   const SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  name,
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: AppColor.kWhiteColor,
                      fontSize: 20),
                ),
                Text(
                  '\$$price',
                  style: TextStyle(
                      color: AppColor.kWhiteColor,
                      fontSize: 16,
                      fontWeight: FontWeight.bold),
                ),
              ],
            ),
            const SizedBox(height: 5),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  location,
                  style: const TextStyle(
                      color: AppColor.kWhiteColor,
                      fontSize: 14,
                      fontWeight: FontWeight.w500),
                ),
                InkWell(
                  onTap: sendTap,
                  child: CircleAvatar(
                      radius: 20,
                      backgroundColor: AppColor.kWhiteColor,
                      child: SvgPicture.asset(
                        'assets/svg/Vector.svg',
                        color: AppColor.kPrimaryColor,
                      )),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
