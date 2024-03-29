


import '../../../../data/const/export.dart';

class AllTestScreen extends StatelessWidget {
  AllTestScreen({super.key});

  final controller = Get.put(AllTestScreenController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.kSecondaryColor,
      appBar: buildNavigateAppbar('Tests'),
      body: RefreshIndicator(
        onRefresh: () async {
          controller.initializeMethod();
        },
        child: GetBuilder<AllTestScreenController>(builder: (controller) {
          final data = controller.allTestList;
          return controller.isProgress
              ? const SimmerScheduleCardList()
              : data.isEmpty
                  ? const EmptyListText()
                  : SizedBox(
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
                  );
        }),
      ),
    );
  }
}