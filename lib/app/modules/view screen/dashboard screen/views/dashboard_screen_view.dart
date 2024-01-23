import '../../../../data/const/export.dart';
import '../../../widgets/appbar.dart';

class DashboardScreenView extends StatelessWidget {
  DashboardScreenView({Key? key}) : super(key: key);
  final _scaffoldKey = GlobalKey<ScaffoldState>();
  final _controller = Get.put(DashboardScreenController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildPrimaryAppBar(
          text: 'Dashboard',
          badge: '4',
          notificationTap: () {
            Get.toNamed(RouteName.notificationScreen);
          }),
      drawer: CustomDrawer(scaffoldKey: _scaffoldKey),
      key: _scaffoldKey,
      backgroundColor: AppColor.kSecondaryColor,
      body: SafeArea(
        child: ListView(
          children: [
            const SizedBox(height: 20),
            SmallDetailsDashboardCard(
                leftOnTap: () {
                  Get.toNamed(RouteName.totalCommissionScreen);
                },
                rightOnTap: () {
                  Get.toNamed(RouteName.totalSalesScreen);
                },
                leftTitle: _controller.text,
                rightCount: '10,000',
                rightTitle: 'Total Sales',
                leftCount: '3,500'),
            SmallDetailsDashboardCard(
                leftOnTap: () {
                  Get.toNamed(RouteName.doctorOnboardScreen);
                },
                rightOnTap: () {
                  Get.toNamed(RouteName.doctorVisitedScreen);
                },
                leftTitle: 'Doctor onboard',
                rightCount: '300',
                rightTitle: 'Doctor visited',
                leftCount: '20'),
            const CustomChart(),
            GetBuilder<DashboardScreenController>(
              builder: (c) => c.isProgress
                  ? CircularProgressIndicator()
                  : SalesTargetedProgressCard(
                      onTap: () {
                        Get.toNamed(RouteName.salesTargetScreen);
                      },
                      text: c.dashboardDataList['title'],
                      progress:c.dashboardDataList['progress'],
                      collaborate: c.dashboardDataList['agents_count'],
                      totalCompletedSales: c.dashboardDataList['target_amount'],
                      totalSales: c.dashboardDataList['amount_collected']),
            ),
          ],
        ),
      ),
    );
  }
}
