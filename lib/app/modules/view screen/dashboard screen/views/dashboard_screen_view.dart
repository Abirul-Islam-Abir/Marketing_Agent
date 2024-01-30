import 'dart:io';

import 'package:shimmer/shimmer.dart';

import '../../../../data/const/export.dart';
import '../../../widgets/dashboard_count_shimmer.dart';
import '../../../widgets/targets_card_shimmer.dart';
import '../components/dashboard_count.dart';

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
              children: [
                const SizedBox(height: 20),
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
              ],
            );
          }),
        ),
      ),
    );
  }
}

class Ticket extends StatelessWidget {
  const Ticket({
    super.key,
    required this.targetId,
    required this.userId,
  });

  final String targetId, userId;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(15),
      child: Container(
        height: 60,
        width: double.infinity,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            color: AppColor.kWhiteColor.withOpacity(0.10),
            border: Border.all(width: 2, color: AppColor.kGreyColor)),
        child: Center(
          child: Text(
            'Token: #T${targetId}A${userId}',
            style: TextStyle(
                color: AppColor.kWhiteColor,
                fontWeight: FontWeight.bold,
                fontSize: 20),
          ),
        ),
      ),
    );
  }
}

class TicketShimmer extends StatelessWidget {
  const TicketShimmer({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(15),
      child: Shimmer.fromColors(
        baseColor: AppColor.kGreyColor,
        highlightColor: AppColor.kShimmerWhite,
        child: Container(
          height: 60,
          width: double.infinity,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              color: AppColor.kWhiteColor.withOpacity(0.10),
              border: Border.all(width: 2, color: AppColor.kGreyColor)),
          child: Center(
            child: Text(
              '',
              style: TextStyle(
                  color: AppColor.kWhiteColor,
                  fontWeight: FontWeight.bold,
                  fontSize: 20),
            ),
          ),
        ),
      ),
    );
  }
}