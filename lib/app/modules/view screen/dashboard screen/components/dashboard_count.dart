import '../../../../data/const/export.dart';

class DashboardCount extends StatelessWidget {
  const DashboardCount(
      {super.key,
      required this.visitedTap,
      required this.onboardTap,
      required this.doctorOnboard,
      required this.doctorOnboardCounts,
      required this.doctorVisited,
      required this.doctorVisitedCounts,
      required this.commissionTap,
      required this.salesTap,
      required this.totalCommission,
      required this.totalSales,
      required this.totalCommissionCount, required this.totalSalesCounts});
  final Function() visitedTap,
      onboardTap,
      commissionTap,
      salesTap;
  final String doctorOnboard,
      doctorOnboardCounts,
      doctorVisited,
      doctorVisitedCounts,
      totalCommission,
      totalSales,
      totalCommissionCount,totalSalesCounts;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SmallDetailsDashboardCard(
            totalCommissionTap: visitedTap,
            totalSalesTap: onboardTap,
            totalCommissionTitle: doctorOnboard,
            totalCommissionCount: doctorOnboardCounts,
            totalSalesTitle: doctorVisited,
            totalSalesCount: doctorVisitedCounts),
        SmallDetailsDashboardCard(
            totalCommissionTap: commissionTap,
            totalSalesTap: salesTap,
            totalCommissionTitle: totalCommission,
            totalCommissionCount: totalCommissionCount,
            totalSalesTitle: totalSales,
            totalSalesCount:totalSalesCounts)
      ],
    );
  }
}