import 'dart:io';

import 'package:pie_chart/pie_chart.dart';
import 'package:shimmer/shimmer.dart';

import '../../../../data/const/export.dart';
import '../../../widgets/dashboard_count_shimmer.dart';
import '../../../widgets/targets_card_shimmer.dart';
import '../../../widgets/ticket_shimmer.dart';
import '../components/custom_pi_chart.dart';
import '../components/dashboard_count.dart';
import '../components/ticket.dart';

class DashboardScreenView extends StatelessWidget {
  DashboardScreenView({Key? key}) : super(key: key);
  final _scaffoldKey = GlobalKey<ScaffoldState>();
  final _controller = Get.put(DashboardScreenController());
  final _profileController = Get.put(ProfileScreenController());

  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: false,
      onPopInvoked: (didPop) {
        _scaffoldKey.currentState?.closeDrawer();
        takePhotoDialog(context, title: 'Are you want to exit?', yesTap: () {
          exit(0);
        }, img: 'assets/svg/cross-svgrepo-com.svg');
      },
      child: Scaffold(
        appBar: buildPrimaryAppBar(
            text: 'Dashboard',
            badge: '4',
            notificationTap: () {
              Get.toNamed(RouteName.notificationScreen);
            }),
        drawer: CustomDrawer(scaffoldKey: _scaffoldKey),
        key: _scaffoldKey,
        backgroundColor: AppColor.kSecondaryColor,
        body: RefreshIndicator(
          onRefresh: () async {
            _controller.initializeMethod();
            _profileController.initializeMethod();
          },
          child: GetBuilder<DashboardScreenController>(builder: (controller) {
            final data = controller.currentProgressList;
            final currentTarget =
                controller.currentProgressList['current_target'];
            return ListView(
                physics: AlwaysScrollableScrollPhysics(),
                children: [
                  controller.isProgress
                      ? const TicketShimmer()
                      : Ticket(
                          targetId: controller.currentTargetId! ?? '',
                          userId: controller.userId! ?? ''),
                  controller.isProgress
                      ? const DashboardCountShimmer()
                      : DashboardCount(
                          doctorOnboard: 'Doctor visited',
                          doctorOnboardCounts: '${data['doctor_onboard']}',
                          doctorVisited: 'Doctor onboard',
                          doctorVisitedCounts: '${data['doctor_visited']}',
                          totalCommission: 'Total Commission',
                          totalSales: 'Total Sales',
                          totalCommissionCount: '${data['total_commision']}',
                          totalSalesCounts: '${data['total_sales']}',
                          totalCommissionTap: () {
                            Get.toNamed(RouteName.doctorVisitedScreen);
                          },
                          totalSalesTap: () {
                            Get.toNamed(RouteName.doctorOnboardScreen);
                          },
                          totalCommissionOnTap: () {
                            Get.toNamed(RouteName.totalCommissionScreen);
                          },
                          doctorVisitedTap: () {
                            Get.toNamed(RouteName.totalSalesScreen);
                          },
                        ),
                  controller.isProgress
                      ? const TargetsCardShimmer()
                      : currentTarget.isEmpty
                          ? const Text('')
                          : AgentsTargetedProgressCard(
                              isCurrent: false,
                              onTap: () {
                                Get.toNamed(RouteName.agentScreen);
                              },
                              text: currentTarget['title'],
                              progress: currentTarget['progress'],
                              agentsCount: currentTarget['agents_count'],
                              amountCollected: currentTarget['target_amount'],
                              targetAmount: currentTarget['amount_collected']),
                  SizedBox(height: 30),
                  controller.isProgress
                      ? Container()
                      : CustomPiChart(
                          title: currentTarget['title'],
                          dataMap: {
                            "Flutter": 5,
                            "React": 3,
                            "Xamarin": 2,
                            "Ionic": 2,
                            "ab": 2,
                          },
                        ),
                  SizedBox(height: 80),
                ]);
          }),
        ),
      ),
    );
  }
}