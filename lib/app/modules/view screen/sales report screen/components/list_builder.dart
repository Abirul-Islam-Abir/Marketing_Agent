import 'package:amin_agent/app/modules/view%20screen/sales%20report%20screen/components/sales_report_card.dart';

import '../../../../data/const/export.dart';
import '../../../../model/sales_model.dart';

class ListBuilder extends StatelessWidget {
  const ListBuilder({
    super.key,
    required this.list,
  });
  final List<SalesReportModel> list;
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: list.length,
      shrinkWrap: true,
      itemBuilder: (context, index) => SalesReportCard(
          name: list[index].name,
          target: list[index].target,
          date: list[index].date,
          invoiceNb: list[index].invoiceNb),
    );
  }
}