import '../../../../data/const/export.dart';

class AllTargetsScreenView extends StatelessWidget {
  AllTargetsScreenView({super.key});

  final controller = Get.put(AllTargetsScreenController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.kSecondaryColor,
      appBar: buildNavigateFilterAppBar(
          text: 'All Targets',
          filterTap: () {
            Get.dialog(
              FilterScreenView(
                onTap: () {
                  //when click filter button after Getting back and clear allTargetList,progress
                  // true isFilter joinedSelectedDate otherwise joinedDate and finally initialize method
                  Get.back();
                  controller.allTargetDataList.clear();
                  controller.progress(true);
                  controller.isFilterTap(true);
                  controller.initializeMethod(
                      date: joinedSelectedDates, page: 0);
                },
              ),
            );
          }),
      body: GetBuilder<AllTargetsScreenController>(
        builder: (controller) {
          final data = controller.allTargetDataList;
          return controller.isProgress
              ? const Center(child: CircularProgressIndicator())
              : data.isEmpty
                  ? const EmptyListText()
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
                              final agentCount =
                                  data[index]['agents_count'] ?? 0;
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