import '../../../../data/const/export.dart';
import '../../filter screen/views/filter_screen_view.dart';

class TotalCommissionScreen extends StatelessWidget {
  TotalCommissionScreen({Key? key}) : super(key: key);

  final controller = Get.put(TotalCommissionScreenController());

  @override
  Widget build(BuildContext context) => Scaffold(
        backgroundColor: AppColor.kSecondaryColor, // Replace with your color
        body: SafeArea(
          child: Column(
            children: [
              SecondaryAppBar(
                  text: 'Commissions',
                  filterTap: () => Get.dialog(FilterScreenView())),
              TotalCommissionListView(list: commissionDataList),
            ],
          ),
        ),
      );
}
