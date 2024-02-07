import 'package:amin_agent/app/data/utils/method.dart';

import '../../../../data/const/export.dart';
import '../components/total_sales_card.dart';

class TotalSalesScreen extends StatelessWidget {
    TotalSalesScreen({super.key});
final _controller = Get.put(TotalSalesScreenController());
  @override
  Widget build(BuildContext context) => Scaffold(
      backgroundColor: AppColor.kSecondaryColor,
      appBar:  buildFilterAppBars(
          text: 'Total Sales',
          filterTap: () {
            Get.dialog(FilterScreenView(onTap: () {
              _controller.initializeMethod(selectedRangeDate);
            },));
          }),
      body: SizedBox(
        height: double.infinity,
        child: ListView.builder(
          itemCount: salesReportDataList.length,
          shrinkWrap: true,
          itemBuilder: (context, index) => TotalSalesCard(
              sendTap: () {},
              location: salesReportDataList[index].location,
              name: salesReportDataList[index].name,
              price: salesReportDataList[index].target,
              date: salesReportDataList[index].date,
              invoiceNb: salesReportDataList[index].invoiceNb),
        ),
      ));
}