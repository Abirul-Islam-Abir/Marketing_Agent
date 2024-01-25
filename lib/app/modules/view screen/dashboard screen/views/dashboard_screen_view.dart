import '../../../../data/const/export.dart';
import '../../../widgets/targets_card_shimmer.dart';

class DashboardScreenView extends StatelessWidget {
  DashboardScreenView({Key? key}) : super(key: key);
  final _scaffoldKey = GlobalKey<ScaffoldState>();
  final _dashboardController = Get.put(DashboardScreenController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildPrimaryAppBar(
          text: 'Dashboard',
          badge: '4',
          notificationTap: () {
            Get.toNamed(RouteName.notificationScreen);
          }),
      drawer: CustomDrawer(scaffoldKey: _scaffoldKey),
      key: _scaffoldKey,
      backgroundColor: AppColor.kSecondaryColor,
      body: SafeArea(
        child: RefreshIndicator(
          onRefresh: () async {
            _dashboardController.initializeMethod();
          },
          child: ListView(
            children: [
              const SizedBox(height: 20),
              SmallDetailsDashboardCard(
                  leftOnTap: () {
                    Get.toNamed(RouteName.totalCommissionScreen);
                  },
                  rightOnTap: () {
                    Get.toNamed(RouteName.totalSalesScreen);
                  },
                  leftTitle: _dashboardController.text,
                  rightCount: '10,000',
                  rightTitle: 'Total Sales',
                  leftCount: '3,500'),
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
                  leftCount: '20'),
              const CustomChart(),
              GetBuilder<DashboardScreenController>(
                builder: (controller) {
                  final data = controller.dashboardDataList;
                  return controller.isProgress
                    ? const TargetsCardShimmer()
                    : data.isEmpty
                        ? const Text('')
                        : AgentsTargetedProgressCard(
                            onTap: () {
                              Get.toNamed(RouteName.agentScreen);
                            },
                            text: data['title'],
                            progress: data['progress'],
                            agentsCount: data['agents_count'],
                            amountCollected:
                            data['target_amount'],
                            targetAmount:
                            data['amount_collected']);
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
