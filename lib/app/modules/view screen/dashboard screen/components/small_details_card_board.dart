
import '../../../../data/const/export.dart';

class SmallDetailsDashboardCard extends StatelessWidget {
  const SmallDetailsDashboardCard({
    super.key,
    required this.totalCommissionTitle,
    required this.totalSalesTitle,
    required this.totalSalesCount,
    required this.totalCommissionCount, this.totalCommissionTap, this.totalSalesTap,
  });
  final String totalCommissionTitle, totalSalesTitle, totalSalesCount, totalCommissionCount;
  final Function()? totalCommissionTap,totalSalesTap;
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
                onTap: totalCommissionTap,
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
                        totalCommissionTitle,
                        style: const TextStyle(
                            fontWeight: FontWeight.bold,
                            color: AppColor.kWhiteColor),
                      ), const SizedBox(height: 8,),
                      Text(
                        totalSalesCount,
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
                onTap: totalSalesTap,
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
                        totalSalesTitle,
                        style: const TextStyle(
                            fontWeight: FontWeight.bold,
                            color: AppColor.kWhiteColor),
                      ),
                      const SizedBox(height: 8),
                      Text(
                        totalCommissionCount,
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