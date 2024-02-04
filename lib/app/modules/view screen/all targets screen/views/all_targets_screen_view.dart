import '../../../../data/const/export.dart';
import '../../../widgets/empty_list_text.dart';
import '../components/all_targets_progress_card.dart';

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
              : data.isEmpty
                  ? EmptyListText()
                  : RefreshIndicator(
                      onRefresh: () async {
                        controller.initializeMethod();
                      },
                      child: ListView.builder(
                        itemCount: data.length,
                        shrinkWrap: true,
                        itemBuilder: (context, index) =>
                            AllTargetsProgressCard(
                              sendTap: () {
                                Get.toNamed(RouteName.agentScreen,
                                    arguments: data[index]['target_id']);
                              },
                                doneTap: () {

                                },
                                isCurrent: data[index]['is_current'],

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