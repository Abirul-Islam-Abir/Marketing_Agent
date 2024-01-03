import '../../../../data/const/export.dart';
import '../../../../model/commission_model.dart';
import 'commission_report_card.dart';

class BuildListViewBuilder extends StatelessWidget {
  const BuildListViewBuilder({
    super.key,
    required this.list,
  });
  final List<CommissionModel> list;
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: list.length,
      shrinkWrap: true,
      itemBuilder: (context, index) => CommissionReportCard(
        location: list[index].location,
        target: list[index].target,
      ),
    );
  }
}