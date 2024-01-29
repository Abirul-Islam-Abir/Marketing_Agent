import '../../../../data/const/export.dart';

class DashboardCount extends StatelessWidget {
  const DashboardCount(
      {super.key,
      required this.totalCommissionTap,
      required this.totalSalesTap,
      required this.doctorOnboard,
      required this.doctorOnboardCounts,
      required this.doctorVisited,
      required this.doctorVisitedCounts,
      required this.totalCommissionOnTap,
      required this.doctorVisitedTap,
      required this.totalCommission,
      required this.totalSales,
      required this.totalCommissionCount, required this.totalSalesCounts});
  final Function() totalCommissionTap,
      totalSalesTap,
      totalCommissionOnTap,
      doctorVisitedTap;
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
            totalCommissionTap: totalCommissionTap,
            totalSalesTap: totalSalesTap,
            totalCommissionTitle: doctorOnboard,
            totalCommissionCount: doctorOnboardCounts,
            totalSalesTitle: doctorVisited,
            totalSalesCount: doctorVisitedCounts),
        SmallDetailsDashboardCard(
            totalCommissionTap: totalCommissionOnTap,
            totalSalesTap: doctorVisitedTap,
            totalCommissionTitle: totalCommission,
            totalCommissionCount: totalCommissionCount,
            totalSalesTitle: totalSales,
            totalSalesCount:totalSalesCounts)
      ],
    );
  }
}
