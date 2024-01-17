
import '../../../../data/const/export.dart';

class SmallDetailsDashboardCard extends StatelessWidget {
  const SmallDetailsDashboardCard({
    super.key,
    required this.leftTitle,
    required this.rightTitle,
    required this.leftCount,
    required this.rightCount, this.leftOnTap, this.rightOnTap,
  });
  final String leftTitle, rightTitle, leftCount, rightCount;
  final Function()? leftOnTap,rightOnTap;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 120,
      width: Get.width,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 8),
        child: Row(
          children: [
            Expanded(
              child: InkWell(
                onTap: leftOnTap,
                child: Container(
                  decoration: BoxDecoration(
                    color: AppColor.kWhiteColor.withOpacity(0.20),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        leftTitle,
                        style: const TextStyle(
                            fontWeight: FontWeight.bold,
                            color: AppColor.kWhiteColor),
                      ), const SizedBox(height: 8,),
                      Text(
                        leftCount,
                        style: const TextStyle(
                            fontWeight: FontWeight.bold,
                            color: AppColor.kWhiteColor,
                            fontSize: 20),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            const SizedBox(
              width: 10,
            ),
            Expanded(
              child: InkWell(
                onTap: rightOnTap,
                child: Container(
                  decoration: BoxDecoration(
                    color: AppColor.kWhiteColor.withOpacity(0.20),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        rightTitle,
                        style: const TextStyle(
                            fontWeight: FontWeight.bold,
                            color: AppColor.kWhiteColor),
                      ),
                      const SizedBox(height: 8,),
                      Text(
                        rightCount,
                        style: const TextStyle(
                            fontWeight: FontWeight.bold,
                            color: AppColor.kWhiteColor,
                            fontSize: 20),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}