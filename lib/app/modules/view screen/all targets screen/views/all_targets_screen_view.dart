import '../../../../data/const/export.dart';

class AllTargetsScreenView extends StatelessWidget {
  AllTargetsScreenView({Key? key}) : super(key: key);
  final controller = Get.put(AllTargetsScreenController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.kSecondaryColor,
      appBar: buildFilterAppBar(
          text: 'All Targets',
          filterTap: () {
            Get.dialog(FilterScreenView());
          }),
      body: GetBuilder<AllTargetsScreenController>(
        builder: (c) {
          return controller.isProgress
              ? const ShimmerTargetList()
              : RefreshIndicator(
                  onRefresh: () async {
                    controller.initializeMethod();
                  },
                  child: ListView.builder(
                    itemCount: controller.allTargetDataList.length,
                    shrinkWrap: true,
                    itemBuilder: (context, index) => AgentsTargetedProgressCard(
                        isCurrent: controller.allTargetDataList[index]
                            ['is_current'],
                        onTap: () {
                          if (controller.allTargetDataList[index]
                                  ['is_current'] ==
                              true) {
                            //is active back button
                            Get.toNamed(RouteName.scheduleScreen);
                          }
                        },
                        text: controller.allTargetDataList[index]['title'],
                        progress: '0.5',
                        agentsCount: controller.allTargetDataList[index]
                            ['agents_count'],
                        amountCollected: controller.allTargetDataList[index]
                            ['target_amount'],
                        targetAmount: controller.allTargetDataList[index]
                            ['amount_collected']),
                  ),
                );
        },
      ),
    );
  }
}
