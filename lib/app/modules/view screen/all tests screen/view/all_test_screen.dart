import 'package:amin_agent/app/data/const/export.dart';
import 'package:amin_agent/app/modules/view%20screen/all%20tests%20screen/controller/all_test_screen_controller.dart';
import 'package:amin_agent/app/modules/widgets/empty_list_text.dart';

import '../../../widgets/shimmer_schedule_card_list.dart';
import '../components/all_test_card.dart';

class AllTestScreen extends StatelessWidget {
  AllTestScreen({super.key});

  final controller = Get.put(AllTestScreenController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.kSecondaryColor,
      appBar: buildNavigateAppbar('Tests'),
      body: GetBuilder<AllTestScreenController>(builder: (controller) {
        final data = controller.allTestList;
        return controller.isProgress
            ? const SimmerScheduleCardList()
            : data.isEmpty
                ? const EmptyListText()
                : RefreshIndicator(
                    onRefresh: () async {
                      controller.initializeMethod();
                    },
                    child: SizedBox(
                      height: double.infinity,
                      child: ListView.builder(
                        shrinkWrap: true,
                        itemCount: data.length,
                        itemBuilder: (context, index) {
                          final name = data[index]['test_name'];
                          final progress = data[index]['progress'];
                          final targetAmount = data[index]['target_amount'];
                          final collectedAmount =
                              data[index]['amount_collected'];
                          return AllTestCard(
                              text: name,
                              progress: progress,
                              amountCollected: targetAmount,
                              targetAmount: collectedAmount);
                        },
                      ),
                    ),
                  );
      }),
    );
  }
}