import 'package:amin_agent/app/api%20services/auth/log_out.dart';
import 'package:amin_agent/app/data/utils/store_data.dart';
import 'package:amin_agent/app/data/utils/user_data_key.dart';
import 'package:amin_agent/app/modules/widgets/primary_button.dart';
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
                  menuTap: () {
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

class CustomDrawer extends StatelessWidget {
    CustomDrawer({
    super.key,
   });

 final controller = Get.put(DashboardScreenController());
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: SafeArea(
        child: Column(
          children: [
            const SizedBox(
              height: 20,
            ),
            Container(
              height: 200,
              width: double.infinity,
              child: const Padding(
                padding: EdgeInsets.all(8.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    CircleAvatar(
                      radius: 40,
                    ),
                    Text(
                      'Abirul Islam',
                      style: TextStyle(
                          fontWeight: FontWeight.bold, fontSize: 20),
                    ),
                    Text('0172273487'),
                  ],
                ),
              ),
            ),
          Divider(height: 2,),
          SizedBox(height: 200,),
          PrimaryButton(text: 'Log Out',onTap:controller.logout),

          ],
        ),
      ),
    );
  }
}
