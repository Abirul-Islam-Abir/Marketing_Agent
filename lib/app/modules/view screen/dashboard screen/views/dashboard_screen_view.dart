import 'dart:io';

import '../../../../data/const/export.dart';
import '../../../../data/utils/user_data_key.dart';
import '../../../widgets/dashboard_count_shimmer.dart';
import '../../../widgets/targets_card_shimmer.dart';
import '../components/agents_progress_count.dart';
import '../components/dashboard_count.dart';

class DashboardScreenView extends StatelessWidget {
  DashboardScreenView({super.key});

  final _scaffoldKey = GlobalKey<ScaffoldState>();
  final _controller = Get.put(DashboardScreenController());
  final _profileController = Get.put(ProfileScreenController());
  final _notification = Get.put(NotificationScreenController());

  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: false,
      onPopInvoked: (didPop) {
        _scaffoldKey.currentState?.closeDrawer();
        takePhotoDialog(context, title: 'Want to exit?', yesTap: () {
          exit(0);
        }, img: 'assets/svg/cross-svgrepo-com.svg');
      },
      child: Scaffold(
        appBar: buildPrimaryAppBar(
            text: 'Dashboard',
            badge: '${_notification.notificationList.length}',
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
            final currentTarget = controller.progressList;
            final onboard = '${data['doctor_onboard'] ?? ''}';
            final visited = '${data['doctor_visited'] ?? ''}';
            final commissions = data['total_commision'] ?? '';
            final sales = data['total_sales'] ?? '';
            final title = currentTarget['title'];
            final progress = currentTarget['progress'] ?? '0.0';
            final agentsCount = currentTarget['agents_count'] ?? 0;
            final targetAmount = currentTarget['target_amount'] ?? '0.0';
            final amountCollected = currentTarget['amount_collected'] ?? '0.0';
            return ListView(
                physics: const AlwaysScrollableScrollPhysics(),
                children: [
                  controller.isProgress
                      ? const DashboardCountShimmer()
                      : DashboardCount(
                          doctorOnboard: 'Doctor visited',
                          doctorOnboardCounts: onboard,
                          doctorVisited: 'Doctor onboard',
                          doctorVisitedCounts: visited,
                          totalCommission: 'Total Commission',
                          totalSales: 'Total Sales',
                          totalCommissionCount: '$commissions',
                          totalSalesCounts: '$sales',
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
                      : CurrentTargetProgressCard(
                          isCurrent: false,
                          onTap: () async {
                            final targetId =
                                await box.read(UserDataKey.currentTargetIdKey);
                            if (targetId != null) {
                              Get.toNamed(RouteName.agentScreen,
                                  arguments: targetId);
                            }
                          },
                          text: title,
                          progress: progress,
                          agentsCount: agentsCount,
                          amountCollected: targetAmount,
                          targetAmount: amountCollected),
                  const SizedBox(height: 30),
                  AgentsProgressCount(data: controller.pieChart),
                  const SizedBox(height: 80),
                ]);
          }),
        ),
      ),
    );
  }
}