import 'package:amin_agent/app/model/commission_model.dart';

import '../../../../data/const/export.dart';
import '../../target agents  screen/components/sales_target_card.dart';

class TotalCommissionDetailsScreen extends StatelessWidget {
  const TotalCommissionDetailsScreen(this.list, {Key? key}) : super(key: key);
  final List<CommissionModel> list;
  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: buildNavigateAppbar('Commissions'),
        backgroundColor: AppColor.kSecondaryColor, // Replace with your color
        body: SizedBox(
          height: double.infinity,
          child: ListView.builder(
            itemCount: list.length,
            shrinkWrap: true,
            itemBuilder: (context, index) => SalesTargetCard(
                isMe: false,
                dayLeft: '15 days left',
                target: list[index].target,
                name: list[index].name,
                progress: '0.05',
                completed: list[index].completed),
          ),
        ),
      );
}