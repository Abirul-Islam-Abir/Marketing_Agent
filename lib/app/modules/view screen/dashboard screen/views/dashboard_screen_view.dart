import 'package:amin_agent/app/modules/view%20screen/filter%20screen/views/filter_screen_view.dart';

import '../../../../data/const/export.dart';

class DashboardScreenView extends StatelessWidget {
  DashboardScreenView({Key? key}) : super(key: key);
  final _scaffoldKey = GlobalKey<ScaffoldState>();
  final controller = Get.put(DashboardScreenController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: CustomDrawer(),
      key: _scaffoldKey,
      backgroundColor: AppColor.kSecondaryColor,
      body: SafeArea(
        child: Column(
          children: [
            PrimaryAppBar(
              text: 'Dashboard',
              menuTap: () {
                _scaffoldKey.currentState?.openDrawer();
              },
              notificationTap: () async {
                Get.toNamed(RouteName.notificationScreen);
              },
            ),
            Expanded(
              child: ListView(
                children: [
                  const SizedBox(height: 20),
                  SmallDetailsDashboardCard(
                    leftOnTap: () {
                      Get.toNamed(RouteName.commissionReportScreen);
                    },
                    rightOnTap: () {
                      Get.toNamed(RouteName.salesReportScreen);
                    },
                    leftTitle: controller.text,
                    rightCount: '10000',
                    rightTitle: 'Total Sales',
                    leftCount: '3500',
                  ),
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
                    leftCount: '20',
                  ),
                  const CustomChart(),
                  SalesTargetedProgressCard(
                      onTap: () {
                        Get.toNamed(RouteName.salesTargetScreen);
                      },
                      text: 'Sales Target',
                      progress: 0.5,
                      collaborate: '5',
                      totalCompletedSales: '1000000',
                      totalSales: '500000'),
                  ElevatedButton(
                    onPressed: () {
                      Get.dialog(FilterScreenView());
                    },
                    child: const Text('Click here'),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
