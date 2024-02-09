import '../../../../data/const/export.dart';
import '../../../../data/utils/user_data_key.dart';
import '../../../widgets/empty_list_text.dart';
import '../components/all_targets_progress_card.dart';

class AllTargetsScreenView extends StatelessWidget {
  AllTargetsScreenView({super.key});

  final controller = Get.put(AllTargetsScreenController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.kSecondaryColor,
      appBar: buildNavigateAppbar('All Targets'),
      body: GetBuilder<AllTargetsScreenController>(
        builder: (controller) {
          final data = controller.allTargetDataList;
          return data.isEmpty
              ?   Container()
              : Column(
                  children: [
                    Expanded(
                      child: ListView.builder(
                        controller: controller.scrollController,
                        itemCount: data.length,
                        shrinkWrap: true,
                        itemBuilder: (context, index) {
                          final id = data[index]['target_id'];
                          final isCurrent =
                              data[index]['is_current'] ?? false;
                          final title = data[index]['title'] ?? '';
                          final agentCount = data[index]['agents_count'] ?? 0;
                          final targetAmount =
                              data[index]['target_amount'] ?? '';
                          final progress = data[index]['progress'] ?? '0.0';
                          final collectedAmount =
                              data[index]['amount_collected'] ?? '';
                          return AllTargetsProgressCard(
                              commissionTap: () async {
                                Get.toNamed(RouteName.totalCommissionScreen,
                                    arguments: id);
                              },
                              salesTap: () {
                                Get.toNamed(RouteName.totalSalesScreen,
                                    arguments: id);
                              },
                              testTap: () {
                                Get.toNamed(RouteName.allTestScreen,
                                    arguments: id);
                              },
                              agentTap: () {
                                Get.toNamed(RouteName.agentScreen,
                                    arguments: id);
                              },
                              doctorTap: () {
                                Get.toNamed(
                                    RouteName.targetWiseDoctorVisitedScreen,
                                    arguments: id);
                              },
                              isCurrent: isCurrent,
                              text: title,
                              progress: progress,
                              agentsCount: agentCount,
                              amountCollected: targetAmount,
                              targetAmount: collectedAmount);
                        },
                      ),
                    ),
                    controller.moreLoading
                        ? const Center(child: CircularProgressIndicator())
                        : Container(),
                  ],
                );
        },
      ),
    );
  }
}