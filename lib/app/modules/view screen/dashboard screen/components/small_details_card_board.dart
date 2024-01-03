
import '../../../../data/const/export.dart';

class SmallDetailsDashboardCard extends StatelessWidget {
  const SmallDetailsDashboardCard({
    super.key,
    required this.leftTitle,
    required this.rightTitle,
    required this.leftCount,
    required this.rightCount,
  });
  final String leftTitle, rightTitle, leftCount, rightCount;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 100,
      width: Get.width,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 8),
        child: Row(
          children: [
            Expanded(
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
                    ),
                    Text(
                      leftCount,
                      style: const TextStyle(
                          fontWeight: FontWeight.bold,
                          color: AppColor.kWhiteColor,
                          fontSize: 25),
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(
              width: 10,
            ),
            Expanded(
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
                    Text(
                      rightCount,
                      style: const TextStyle(
                          fontWeight: FontWeight.bold,
                          color: AppColor.kWhiteColor,
                          fontSize: 25),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}