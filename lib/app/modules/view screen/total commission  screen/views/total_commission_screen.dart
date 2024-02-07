import 'package:amin_agent/app/data/utils/method.dart';
import 'package:amin_agent/app/modules/view%20screen/total%20commission%20%20screen/views/total_commission_details_screen.dart';

import '../../../../data/const/export.dart';
import '../components/total_commission_card.dart';

class TotalCommissionScreen extends StatelessWidget {
  TotalCommissionScreen({super.key});
  final _controller = Get.put(TotalCommissionScreenController());
  @override
  Widget build(BuildContext context) => Scaffold(
      backgroundColor: AppColor.kSecondaryColor,
      appBar: buildFilterAppBars(
          text: 'Total Commission',
          filterTap: () {
            Get.dialog(FilterScreenView(
              onTap: () {
                Get.back();
                _controller.initializeMethod(selectedRangeDate);
              },
            ));
          }),
      body: GetBuilder<TotalCommissionScreenController>(builder: (controller) {
        final data = controller.salesAndCommissionList;
        return SizedBox(
          height: double.infinity,
          child: ListView.builder(
            itemCount: commissionDataList.length,
            shrinkWrap: true,
            itemBuilder: (context, index) {
              return TotalCommissionCard(
                location: commissionDataList[index].location,
                target: commissionDataList[index].target,
                date: '01/12/2024',
                sendTap: () {
                  Get.to(TotalCommissionDetailsScreen(commissionDataList));
                },
              );
            },
          ),
        );
      }));
}