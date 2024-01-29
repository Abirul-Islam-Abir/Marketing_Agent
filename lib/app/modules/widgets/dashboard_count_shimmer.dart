import 'package:shimmer/shimmer.dart';

import '../../data/const/export.dart';

class DashboardCountShimmer extends StatelessWidget {
  const DashboardCountShimmer({super.key});

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      baseColor: AppColor.kGreyColor,
      highlightColor: AppColor.kShimmerWhite,
      child: Column(
        children: [
          SmallDetailsDashboardCard(
              totalCommissionTap: () {
                Get.toNamed(RouteName.totalCommissionScreen);
              },
              totalSalesTap: () {
                Get.toNamed(RouteName.totalSalesScreen);
              },
              totalCommissionTitle: ' ',
              totalCommissionCount: ' ',
              totalSalesTitle: ' ',
              totalSalesCount: ' '),
          SmallDetailsDashboardCard(
              totalCommissionTap: () {
                Get.toNamed(RouteName.totalCommissionScreen);
              },
              totalSalesTap: () {
                Get.toNamed(RouteName.totalSalesScreen);
              },
              totalCommissionTitle: ' ',
              totalCommissionCount: ' ',
              totalSalesTitle: ' ',
              totalSalesCount: ' '),
        ],
      ),
    );
  }
}
