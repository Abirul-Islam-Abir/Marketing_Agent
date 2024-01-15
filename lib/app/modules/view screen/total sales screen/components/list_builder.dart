 import 'package:amin_agent/app/modules/view%20screen/total%20sales%20screen/components/sales_report_card.dart';

import '../../../../data/const/export.dart';
import '../../../../model/sales_model.dart';

class TotalSalesListView extends StatelessWidget {
  const TotalSalesListView({
    super.key,
    required this.list,
  });
  final List<SalesReportModel> list;
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView.builder(
        itemCount: list.length,
        shrinkWrap: true,
        itemBuilder: (context, index) => TotalSalesCard(
          sendTap: (){},
            location: list[index].location,
            name: list[index].name,
            price: list[index].target,
            date: list[index].date,
            invoiceNb: list[index].invoiceNb),
      ),
    );
  }
}