import '../../../../data/const/export.dart';
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
          return controller.isProgress
              ? const ShimmerTargetList()
              : data.isEmpty
                  ? EmptyListText()
                  : RefreshIndicator(
                      onRefresh: () async {
                        controller.initializeMethod();
                      },
                      child: ListView.builder(
                        itemCount: data.length,
                        shrinkWrap: true,
                        itemBuilder: (context, index) {
                          final id = data[index]['target_id'];
                          final isCurrent = data[index]['is_current'];
                          final title = data[index]['title'];

                          final agentCount = data[index]['agents_count'];
                          final targetAmount = data[index]['target_amount'];
                          final collectedAmount =
                              data[index]['amount_collected'];
                          return AllTargetsProgressCard(
                              sendTap: () {
                                Get.toNamed(RouteName.agentScreen,
                                    arguments: id);
                              },
                              doneTap: () {
                                Get.toNamed(
                                    RouteName.targetWiseDoctorVisitedScreen,
                                    arguments: id);
                              },
                              isCurrent: isCurrent,
                              text: title,
                              progress: '0.5',
                              agentsCount: agentCount,
                              amountCollected: targetAmount,
                              targetAmount: collectedAmount);
                        },
                      ),
                    );
        },
      ),
    );
  }
}