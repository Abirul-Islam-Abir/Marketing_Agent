import '../../../../data/const/export.dart';
import '../../schedule screen/views/schedule_screen_agent_view.dart';

class AllTargetsScreenView extends StatelessWidget {
  AllTargetsScreenView({Key? key}) : super(key: key);
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
              : RefreshIndicator(
                  onRefresh: () async {
                    controller.initializeMethod();
                  },
                  child: ListView.builder(
                    itemCount: data.length,
                    shrinkWrap: true,
                    itemBuilder: (context, index) => AgentsTargetedProgressCard(
                        isCurrent: data[index]['is_current'],
                        onTap: () {
                          //Only navigate current target
                          if (data[index]['is_current'] == true) {
                            Get.to(() => ScheduleScreenAgentView());
                          }
                        },
                        text: data[index]['title'],
                        progress: '0.5',
                        agentsCount: data[index]['agents_count'],
                        amountCollected: data[index]['target_amount'],
                        targetAmount: data[index]['amount_collected']),
                  ),
                );
        },
      ),
    );
  }
}