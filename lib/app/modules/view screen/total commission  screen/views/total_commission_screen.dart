import 'package:amin_agent/app/data/utils/method.dart';
import 'package:amin_agent/app/modules/view%20screen/total%20commission%20%20screen/views/total_commission_details_screen.dart';

import '../../../../data/const/export.dart';
import '../../../widgets/empty_list_text.dart';
import '../components/total_commission_card.dart';

class TotalCommissionScreen extends StatelessWidget {
  TotalCommissionScreen({super.key});

  final _controller = Get.put(TotalCommissionScreenController());

  @override
  Widget build(BuildContext context) => Scaffold(
        backgroundColor: AppColor.kSecondaryColor,
        appBar: buildNavigateFilterAppBar(
            text: 'Total Commission',
            filterTap: () {
              Get.dialog(FilterScreenView(
                onTap: () {
                  Get.back();
                  _controller.initializeMethod(joinedSelectedDates, 1);
                },
              ));
            }),
        body: GetBuilder<TotalCommissionScreenController>(
          builder: (controller) {
            final data = controller.salesAndCommissionList;
            return controller.isProgress
                ? const ShimmerTargetList()
                : data.isEmpty
                    ? const EmptyListText()
                    : RefreshIndicator(
                        onRefresh: () async {
                          controller.initializeMethod(joinedDates, 1);
                        },
                        child: SizedBox(
                          height: double.infinity,
                          child: ListView.builder(
                            controller: controller.scrollController,
                            itemCount: data.length,
                            shrinkWrap: true,
                            itemBuilder: (context, index) {
                              final name = data[index]['doctor_name'] ?? "";
                              final commission =
                                  data[index]['sale_amount'] ?? '';
                              final date = data[index]['date'] ?? '';
                              return TotalCommissionCard(
                                name: name,
                                commission: commission,
                                date: date,
                              );
                            },
                          ),
                        ),
                      );
          },
        ),
      );
}