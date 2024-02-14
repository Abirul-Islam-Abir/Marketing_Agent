import 'dart:io';
import 'package:amin_agent/app/modules/view%20screen/dashboard%20screen/components/data_table.dart';
import '../../../../data/const/export.dart';
import '../../../widgets/shimmer_table.dart';

class DashboardScreenView extends StatelessWidget {
  DashboardScreenView({super.key});

  final _scaffoldKey = GlobalKey<ScaffoldState>();
  final _controller = Get.put(DashboardScreenController());
  final _profileController = Get.put(ProfileScreenController());
  final noti = Get.put(NotificationScreenController());

  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: false,
      onPopInvoked: (didPop) {
        _scaffoldKey.currentState?.closeDrawer();
        takePhotoDialog(context, title: 'Want to exit?', yesTap: () {
          exit(0);
        }, img: AppImages.crossSvg);
      },
      child: RefreshIndicator(
        onRefresh: () async {
          _controller.initializeMethod();
          _profileController.initializeMethod();
        },
        child: UpdateAvailable(
          packageName: _controller.isUpdateAvailable['packageName'] ?? '',
          isUpdate:
          _controller.isUpdateAvailable['appVersion'] != AppInfo.appVersion
              ? true
              : false,
          child: GetBuilder<DashboardScreenController>(builder: (controller) {
            final notiLength = controller.unreadNotification;
            final read = notiLength['unread_notifications_count'] ?? 0;
            return Scaffold(
              appBar: buildPrimaryAppBar(
                  text: 'Dashboard',
                  badge: '${read >= 99 ? '99+' : read}',
                  notificationTap: ()   {
                    Get.find<NotificationScreenController>().readNotification();
                    Get.toNamed(RouteName.notificationScreen);
                  }),
              drawer: CustomDrawer(scaffoldKey: _scaffoldKey),
              key: _scaffoldKey,
              backgroundColor: AppColor.kSecondaryColor,
              body: GetBuilder<DashboardScreenController>(builder: (controller) {
                final data = controller.currentProgressList;
                final currentTarget = controller.progressList;
                final onboard = '${data['doctor_onboard'] ?? ''}';
                final visited = '${data['doctor_visited'] ?? ''}';
                final commissions = data['total_commision'] ?? '';
                final sales = data['total_sales'] ?? '';
                final title =
                    currentTarget['title'] ?? 'You have no target right now';
                final progress = currentTarget['progress'] ?? '0.0';
                final agentsCount = currentTarget['agents_count'] ?? 0;
                final targetAmount = currentTarget['target_amount'] ?? '0.0';
                final amountCollected = currentTarget['amount_collected'] ?? '0.0';
                return ListView(children: [
                  controller.isProgress
                      ? const DashboardCountShimmer()
                      : DashboardCount(
                    doctorOnboard: AppString.doctorVisited,
                    doctorOnboardCounts: onboard,
                    doctorVisited: AppString.doctorOnboard,
                    doctorVisitedCounts: visited,
                    totalCommission: AppString.totalCommission,
                    totalSales: AppString.totalSales,
                    totalCommissionCount: '$commissions',
                    totalSalesCounts: '$sales',
                    visitedTap: () {
                      Get.toNamed(RouteName.doctorVisitedScreen);
                    },
                    onboardTap: () {
                      Get.toNamed(RouteName.doctorOnboardScreen);
                    },
                    commissionTap: () async {
                      Get.toNamed(RouteName.totalCommissionScreen);
                    },
                    salesTap: () async {
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
                  const SizedBox(height: 15),
                  controller.isProgress
                      ? const ShimmerTable()
                      : DataTable2SimpleDemo(),
                  const SizedBox(height: 60),
                ]);
              }),
            );
          }),
        ),
      ),
    );
  }
}