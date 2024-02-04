import 'dart:io';


import '../../../../data/const/export.dart';
import '../../../../data/utils/user_data_key.dart';
import '../../../widgets/dashboard_count_shimmer.dart';
import '../../../widgets/demo_target_progress_card.dart';
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
  final _notificationController = Get.put(NotificationScreenController());

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
            badge: '${_notificationController.readNotificationList.length}',
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
                physics: const AlwaysScrollableScrollPhysics(),
                children: [
                  controller.isProgress
                      ? const DashboardCountShimmer()
                      : DashboardCount(
                          doctorOnboard: 'Doctor visited',
                          doctorOnboardCounts:
                              '${data['doctor_onboard'] ?? ''}',
                          doctorVisited: 'Doctor onboard',
                          doctorVisitedCounts:
                              '${data['doctor_visited'] ?? ''}',
                          totalCommission: 'Total Commission',
                          totalSales: 'Total Sales',
                          totalCommissionCount:
                              '${data['total_commision'] ?? ''}',
                          totalSalesCounts: '${data['total_sales'] ?? ''}',
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
                      : currentTarget != null
                          ? CurrentTargetProgressCard(
                              isCurrent: false,
                              onTap: () async {
                                final targetId = await box
                                    .read(UserDataKey.currentTargetIdKey);
                                if (targetId != null) {
                                  Get.toNamed(RouteName.agentScreen,
                                      arguments: targetId);
                                }
                              },
                              text: currentTarget['title'] ?? ' ',
                              progress: currentTarget['progress'] ?? '0.0',
                              agentsCount: currentTarget['agents_count'] ?? 0,
                              amountCollected:
                                  currentTarget['target_amount'] ?? '0.0',
                              targetAmount:
                                  currentTarget['amount_collected'] ?? '0.0')
                          : DemoTargetProgressCard(),
                  const SizedBox(height: 30),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: List.generate(
                      controller.pieChart.length,
                      (index) => Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 10),
                        child: Text(
                          '${controller.pieChart[index]['agent_name']} -'
                          ' ${controller.pieChart[index]['sell_amount'].toDouble()}%',
                          style: TextStyle(
                              color: AppColor.kWhiteColor,
                               fontSize: 15),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: 80),
                ]);
          }),
        ),
      ),
    );
  }
}