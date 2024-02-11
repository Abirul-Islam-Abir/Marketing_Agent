import 'package:amin_agent/app/data/utils/method.dart';

import '../../../../data/const/export.dart';
import '../../../widgets/empty_list_text.dart';
import '../../total commission  screen/components/total_commission_card.dart';
import '../components/total_sales_card.dart';

class TotalSalesScreen extends StatelessWidget {
  TotalSalesScreen({super.key});

  final _controller = Get.put(TotalCommissionScreenController());

  @override
  Widget build(BuildContext context) => Scaffold(
        backgroundColor: AppColor.kSecondaryColor,
        appBar: buildNavigateFilterAppBar(
            text: 'Total Sales',
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