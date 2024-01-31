import 'package:amin_agent/app/data/const/export.dart';
import 'package:amin_agent/app/modules/view%20screen/all%20tests%20screen/controller/all_test_screen_controller.dart';

import '../../../widgets/shimmer_schedule_card_list.dart';

class AllTestScreen extends StatelessWidget {
  AllTestScreen({super.key});

  final controller = Get.put(AllTestScreenController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.kSecondaryColor,
      appBar: buildNavigateAppbar(
            'Tests'),
      body: GetBuilder<AllTestScreenController>(builder: (controller) {
        final data = controller.allTestList;
        return controller.isProgress
            ? const SimmerScheduleCardList()
            : controller.allTestList.isEmpty
                ? const Center(child: Text('There is no schedules'))
                : RefreshIndicator(
                    onRefresh: () async {
                      controller.initializeMethod();
                    },
                    child: SizedBox(
                      height: double.infinity,
                      child: ListView.builder(
                        itemCount: data.length,
                        itemBuilder: (context, index) =>
                            AgentsTargetedProgressCard(
                                isCurrent: false,
                                onTap: () {
                                  Get.toNamed(RouteName.agentScreen);
                                },
                                text: data[index]['test_name'],
                                progress: data[index]['progress'],
                                agentsCount: 2,
                                amountCollected: data[index]
                                    ['amount_collected'],
                                targetAmount: data[index]['target_amount']),
                      ),
                    ),
                  );
      }),
    );
  }
}