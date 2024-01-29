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
      canPop: true,
      onPopInvoked: (didPop) {},
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
          child: ListView(
            children: [
              const SizedBox(height: 20),
              GetBuilder<DashboardScreenController>(builder: (controller) {
                final data = controller.currentProgressList;
                return controller.isProgress
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
                      );
              }),
              GetBuilder<DashboardScreenController>(
                builder: (controller) {
                  final data = controller.currentProgressList['current_target'];
                  return controller.isProgress
                      ? const TargetsCardShimmer()
                      : data.isEmpty
                          ? const Text('')
                          : AgentsTargetedProgressCard(
                              isCurrent: false,
                              onTap: () {
                                Get.toNamed(RouteName.agentScreen);
                              },
                              text: data['title'],
                              progress: data['progress'],
                              agentsCount: data['agents_count'],
                              amountCollected: data['target_amount'],
                              targetAmount: data['amount_collected']);
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
