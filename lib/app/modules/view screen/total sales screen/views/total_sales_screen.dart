import '../../../../data/const/export.dart';
import '../components/total_sales_card.dart';

class TotalSalesScreen extends GetView<TotalSalesScreeenController> {
  const TotalSalesScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) => Scaffold(
      backgroundColor: AppColor.kSecondaryColor,
      appBar: buildNavigateAppbar('sales'),
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