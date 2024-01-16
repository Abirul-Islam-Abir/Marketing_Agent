import 'package:amin_agent/app/model/commission_model.dart';
import 'package:amin_agent/app/modules/widgets/appbar.dart';

import '../../../../data/const/export.dart';

class TotalCommissionDetailsScreen extends GetView<SalesTargetScreenController> {
  const TotalCommissionDetailsScreen(this.list, {Key? key}) : super(key: key);
  final List<CommissionModel> list;
  @override
  Widget build(BuildContext context) => Scaffold(
    appBar: buildNavigateAppbar('Commissions'),
    backgroundColor: AppColor.kSecondaryColor, // Replace with your color
    body: ListView.builder(
      itemCount: list.length,
      shrinkWrap: true,
      itemBuilder: (context, index) => SalesTargetCard(
          dayLeft: '15 days left',
          target: list[index].target,
          name: list[index].name,
          progress: list[index].progress,
          completed: list[index].completed),
    ),
  );
}