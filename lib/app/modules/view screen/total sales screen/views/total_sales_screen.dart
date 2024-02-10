import 'package:amin_agent/app/data/utils/method.dart';

import '../../../../data/const/export.dart';
import '../../../widgets/empty_list_text.dart';
import '../../total commission  screen/components/total_commission_card.dart';
import '../components/total_sales_card.dart';

class TotalSalesScreen extends StatelessWidget {
  TotalSalesScreen({super.key});

  final _controller = Get.put(TotalSalesScreenController());

  @override
  Widget build(BuildContext context) => Scaffold(
      backgroundColor: AppColor.kSecondaryColor,
      appBar: buildNavigateFilterAppBar(
          text: 'Total Sales',
          filterTap: () {
            Get.dialog(FilterScreenView(
              onTap: () {
                Get.back();
                _controller.initializeMethod(joinedSelectedDates);
              },
            ));
          }),
      body: GetBuilder<TotalCommissionScreenController>(builder: (controller) {
        final data = controller.salesAndCommissionList;
        return controller.isProgress
            ? const ShimmerTargetList()
            : data.isEmpty
            ? const EmptyListText()
            : RefreshIndicator(
          onRefresh: () async {
            controller.initializeMethod(joinedDates);
          },
          child: SizedBox(
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

                  },
                );
              },
            ),
          ),
        );
      }));}