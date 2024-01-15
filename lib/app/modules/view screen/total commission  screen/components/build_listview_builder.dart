import '../../../../data/const/export.dart';
import '../../../../model/commission_model.dart';
import 'total_commission_card.dart';

class BuildListViewBuilder extends StatelessWidget {
  const BuildListViewBuilder({
    super.key,
    required this.list,
  });
  final List<CommissionModel> list;
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView.builder(
        itemCount: list.length,
        shrinkWrap: true,
        itemBuilder: (context, index) => TotalCommissionCard(
          location: list[index].location,
          target: list[index].target,
          date: '01/12/2024',
          sendTap: (){},
        ),
      ),
    );
  }
}