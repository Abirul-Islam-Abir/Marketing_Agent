import 'package:amin_agent/app/api%20services/auth/log_out.dart';
import 'package:amin_agent/app/data/utils/store_data.dart';
import 'package:amin_agent/app/data/utils/user_data_key.dart';
import 'package:amin_agent/app/theme/app_color.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../routes/app_pages.dart';
import '../components/custom_chart.dart';
import '../components/dashboard_text.dart';
import '../components/sales_targeted_dashboard_progress_card.dart';
import '../components/small_details_card_board.dart';
import '../controllers/dashboard_screen_controller.dart';

class DashboardScreenView extends GetView<DashboardScreenController> {
  DashboardScreenView({Key? key}) : super(key: key);
  final _scaffoldKey = GlobalKey<ScaffoldState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const Drawer(),
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
                  menuTap: () {
                    _scaffoldKey.currentState?.openDrawer();
                  },
                  notificationTap: () async {
                    final response = await logOutRequest();
                    print(response);
                    if (response['success'] == true) {
                      Get.offAllNamed(RouteName.loginScreen);
                      box.remove(UserDataKey.tokenKey);
                    }
                    //  Get.toNamed(RouteName.notificationScreen);
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
                  leftTitle: 'Total commission',
                  rightCount: '10000',
                  rightTitle: 'Total Sales',
                  leftCount: '3500',
                ),
                SmallDetailsDashboardCard(
                  leftOnTap: () {
                    Get.toNamed(RouteName.doctorOnboardScreen);
                  },
                  rightOnTap: () {
                    Get.toNamed(RouteName.salesTargetScreen);
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
