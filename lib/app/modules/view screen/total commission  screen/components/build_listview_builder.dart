import '../../../../data/const/export.dart';
import '../../../../model/commission_model.dart';
import '../../filter screen/views/filter_screen_view.dart';
import 'total_commission_card.dart';

class TotalCommissionListView extends StatelessWidget {
  const TotalCommissionListView({
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
          sendTap: (){
          Get.to(TotalCommissionDetailsScreen(list));
          },
        ),
      ),
    );
  }
}
class TotalCommissionDetailsScreen extends GetView<SalesTargetScreenController> {
  const TotalCommissionDetailsScreen(this.list, {Key? key}) : super(key: key);
final List<CommissionModel> list;
  @override
  Widget build(BuildContext context) => Scaffold(
    backgroundColor: AppColor.kSecondaryColor, // Replace with your color
    body: SafeArea(
      child: SizedBox(
        width: double.infinity,
        child: Column(
          children: [
            SecondaryAppBar(text: 'Targets',filterTap: () => Get.dialog(FilterScreenView())),
            Expanded(
              child: ListView.builder(
                itemCount: salesTargetGroupList.length,
                shrinkWrap: true,
                itemBuilder: (context, index) => SalesTargetCard(
                    dayLeft: '15 days left',
                    target: list[index].target,
                    name: list[index].name,
                    progress: list[index].progress,
                    completed: salesTargetGroupList[index].completed),
              ),
            ),
          ],
        ),
      ),
    ),
  );
}