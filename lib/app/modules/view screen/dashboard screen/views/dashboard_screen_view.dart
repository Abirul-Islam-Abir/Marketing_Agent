import '../../../../data/const/export.dart';
import '../../../../data/utils/user_data_key.dart';

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
        child: SizedBox(
          width: double.infinity,
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                PrimaryAppBar(
                  text: 'Dashboard',
                  menuTap: () async {
                    final token = await box.read(UserDataKey.tokenKey);
                    if (token != null) {
                      print(token);
                    }

                    _scaffoldKey.currentState?.openDrawer();
                  },
                  notificationTap: () async {
                    Get.toNamed(RouteName.notificationScreen);
                  },
                ),
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
              ],
            ),
          ),
        ),
      ),
    );
  }
}
