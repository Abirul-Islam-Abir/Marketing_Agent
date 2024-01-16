import '../../../../data/const/export.dart';
import '../../../widgets/appbar.dart';

class DashboardScreenView extends StatelessWidget {
  DashboardScreenView({Key? key}) : super(key: key);
  final _scaffoldKey = GlobalKey<ScaffoldState>();
  final controller = Get.put(DashboardScreenController());

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
                leftTitle: controller.text,
                rightCount: '10000',
                rightTitle: 'Total Sales',
                leftCount: '3500'),
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
            SalesTargetedProgressCard(
                onTap: () {
                  Get.toNamed(RouteName.salesTargetScreen);
                },
                text: 'Sales Target',
                progress: 0.5,
                collaborate: '5',
                totalCompletedSales: '1000000',
                totalSales: '500000')
          ],
        ),
      ),
    );
  }
}
